# Annex: Obsidian Plugin Technical Documentation

## I. Core Concepts and Architecture

This section provides the foundational architectural model of the Obsidian plugin environment. To plan and execute code, an agent must operate within the "laws of physics" of this environment: the separation of data and view, the security sandbox, and critical performance boundaries.

### Plugin Anatomy: Key Files

A standard plugin structure is based on the official sample plugin.

- **`main.ts`**: The TypeScript entry point. This file must export a default class that extends `Plugin`. This class defines the plugin's lifecycle, primarily through the `onload()` and `onunload()` methods.

- **`manifest.json`**: The plugin's identity file. This mandatory JSON file provides metadata to Obsidian, such as the plugin's `id`, `name`, `version`, and `minAppVersion`. It is required for both loading and release.

- **`styles.css`**: (Optional) A CSS file for styling UI components. If used, this file must be included in the GitHub release assets.

- **`main.js`**: The _compiled_ JavaScript output from `main.ts`. This is the file Obsidian actually executes. It is a build artifact, not a source file.

### The Build Process: From TypeScript to `main.js`

Obsidian plugins are written in TypeScript (`.ts`) to leverage type checking and the API's TSDoc comments. Obsidian itself executes JavaScript (`.js`), necessitating a build process to compile the source code.

The standard build process uses `npm` (or yarn) and a bundler such as `esbuild`.

- `npm install`: Installs dependencies, most importantly the `obsidian-api` TypeScript definitions.

- `npm run dev`: Compiles `main.ts` to `main.js` and "watches" the source files, automatically recompiling on any change.

- `npm run build`: Creates a minified, production-ready `main.js` bundle. This is a critical step for optimizing plugin load time and is used for the final release.

### The Sandbox and Platform Limitations

Obsidian plugins do not have unrestricted access to the user's computer.

- **Desktop vs. Mobile**: This is the primary constraint. The desktop application is built on Electron, which provides access to Node.js and Electron APIs (e.g., `fs`, `crypto`, `os`). The mobile application does not have this layer.

- **Architectural Consequence**: If a plugin's requirements necessitate Node.js APIs, it _must_ set `isDesktopOnly: true` in its `manifest.json`. This is an irreversible architectural decision that forfeits mobile compatibility.

- **Security**: The plugin review process and API design enforce a strict security model. Direct DOM manipulation with `innerHTML` is forbidden to prevent XSS attacks. Use of private, undocumented APIs (e.g., `app.innards`) is not permitted and will result in rejection.

### Key Architectural Distinctions: Vault, Workspace, and Editor

This is the most critical architectural concept for a code-generating agent to understand. Most logical errors stem from confusing these three separate domains.

- **1. The Vault (Data Layer)**: Represented by `this.app.vault`. This is the API for the file system. It performs CRUD (Create, Read, Update, Delete) operations on files (`TFile`) and folders (`TFolder`).

  - **Key Property**: `Vault` operations read from and write to the disk. They are _not_ necessarily aware of what the user is currently seeing or typing in the editor.

- **2. The Workspace (UI Layer)**: Represented by `this.app.workspace`. This is the API for the application's UI: panes, leaves (tabs), and views. It manages _what_ is visible and _where_.

- **3. The Editor (Text Layer)**: Represented by `view.editor`. This is the API for the text-editing component itself (CodeMirror 6).

  - **Key Property**: The `Editor` API interacts with the _current, in-memory state_ of the text, which may be different from what is saved on disk. `editor.getValue()` gets the current text in the buffer, while `vault.read()` gets the last saved text from the file.

### Asynchronous Programming (`async/await`)

Nearly all file system (`Vault`) and data loading (`loadData`) operations are asynchronous. They return a `Promise<T>`.

All plugin code that interacts with these systems must be written using `async/await` syntax. The `onload` and `onunload` methods are themselves `async`. A failure to `await` an API call (e.g., `let content = this.app.vault.read(file)`) will result in a logical error, as the `content` variable will hold a `Promise` object, not the expected `string`.

## II. Environment and Initial Plugin Setup

This section provides a deterministic, step-by-step procedure for bootstrapping a new plugin development environment. This "cold start" procedure should be the default for any "create new plugin" task.

### 1. Prerequisites

The development environment must have `git`, `Node.js`, and `npm` (or `yarn`) installed.

### 2. Clone the Official Sample Plugin

Do not start from an empty folder. The official `obsidian-sample-plugin` is a "template repository" and serves as the _de facto_ specification for a valid plugin structure.

`git clone https://github.com/obsidianmd/obsidian-sample-plugin.git`

This template provides the correct project structure, build scripts, and "Hello World" examples for core features, including a ribbon icon, a command, a modal, and a settings tab.

### 3. Install Dependencies

Navigate into the cloned directory:

cd obsidian-sample-plugin

Run `npm install`. This downloads the `obsidian-api` type definitions and the `esbuild` compiler.

### 4. Build the Plugin (Development Mode)

Run `npm run dev`.

This command compiles `main.ts` into `main.js` and then "watches" the source files. When `main.ts` is modified, the `main.js` file is automatically rebuilt. This `main.js` is the artifact Obsidian will load.

### 5. Load the Plugin in Obsidian (Sideloading)

Obsidian loads plugins from a specific folder within the user's vault. The standard path is `<VaultPath>/.obsidian/plugins/`.

The most direct method for development is to clone the plugin repository directly into this plugins directory:

cd /path/to/my/vault/.obsidian/plugins/

git clone <https://github.com/obsidianmd/obsidian-sample-plugin.git> "my-plugin-name"

#### Enabling the Plugin in Obsidian

1. Open Obsidian's `Settings`.

2. Go to `Community plugins`.

3. Turn _off_ "Safe mode" (this is required to load any third-party plugin).

4. Under `Installed plugins`, find the plugin ("my-plugin-name") and toggle it _on_.

5. This action executes the plugin's `onload()` method.

### 6. The Development Loop

1. Keep the `npm run dev` command running in a terminal.

2. Modify the TypeScript source code (e.g., `main.ts`).

3. `npm run dev` automatically recompiles `main.js`.

4. In Obsidian, go to `Settings` -> `Community plugins`.

5. Toggle the plugin _off_ and then _on_ again. This forces Obsidian to run `onunload()` followed by `onload()`, loading the new code.

## III. The Plugin Manifest (`manifest.json`) Specification

This file is the plugin's "identity card." It is a static JSON file that must be located in the root of the plugin folder. It provides Obsidian with the metadata needed to load, display, and manage the plugin.

The `id`, `version`, and `minAppVersion` fields are not just metadata; they are critical functional keys.

- **`id`**: This is the plugin's programmatic handle. It must match the folder name for local development and is used for inter-plugin communication (`app.plugins.plugins["plugin-id"]`).

- **`version`**: This is the release management key. It _must_ exactly match the GitHub Release "Tag version" for updates to be detected.

- **`minAppVersion`**: This controls which users can install the plugin. Setting it incorrectly can lead to bugs (if too low) or exclude users (if too high).

### Manifest Properties Specification

This table details all properties for the `manifest.json` file.

|**Property**|**Type**|**Required**|**Description**|
|---|---|---|---|
|`id`|`string`|Yes|The unique ID of your plugin. Must not contain "obsidian". Must match the folder name for local development.|
|`name`|`string`|Yes|The display name for the plugin in the UI.|
|`version`|`string`|Yes|The plugin's version, in `x.y.z` Semantic Versioning format.|
|`minAppVersion`|`string`|Yes|The minimum required Obsidian version (e.g., `1.5.0`).|
|`description`|`string`|Yes|A description of what the plugin does.|
|`author`|`string`|Yes|The author's name.|
|`isDesktopOnly`|`boolean`|Yes|Set to `true` if the plugin uses Node.js or Electron APIs.|
|`authorUrl`|`string`|No|A URL to the author's website, blog, or GitHub.|
|`fundingUrl`|`string` \| `object`|No|A URL (or object with multiple URLs) where users can provide financial support.|

### Example `manifest.json`

```json
{
  "id": "example-plugin",
  "name": "Example Plugin",
  "version": "1.0.0",
  "minAppVersion": "1.5.7",
  "description": "This is a sample plugin.",
  "author": "Obsidian MD",
  "authorUrl": "https://obsidian.md",
  "fundingUrl": "https://obsidian.md/pricing",
  "isDesktopOnly": false
}
```

### Understanding `isDesktopOnly`

This boolean is a critical architectural decision point.

- If set to `false` (or omitted, though `true` or `false` is required), the plugin is assumed to be compatible with Obsidian Mobile.

- If set to `true`, the plugin will be _disabled_ on Obsidian Mobile.

- This _must_ be set to `true` if the plugin's code imports or uses _any_ Node.js APIs (`fs`, `crypto`, `os`, `path`) or Electron APIs. Web API alternatives (like `SubtleCrypto`) should be preferred if mobile compatibility is desired.

## IV. The `Plugin` Class and Application Lifecycle

This section details the main entry point of all plugins. All plugins _must_ have a default export class in `main.ts` that extends the base `Plugin` class.

```TypeScript
import { Plugin } from 'obsidian';

export default class ExamplePlugin extends Plugin {
  async onload() {
    //...
  }

  async onunload() {
    //...
  }
}
```

This base `Plugin` class provides access to the application instance via `this.app` and manages the registration/cleanup lifecycle.

**Best Practice**: Always use `this.app`. _Never_ use the global `window.app` or `app`. The global object is for debugging purposes only and may be removed in future versions.

### The `onload()` Method: The Plugin's Entry Point

`async onload()`: This method is called _once_ when Obsidian enables the plugin (either at startup or when toggled on by the user). This is the primary method for all initialization and registration.

**Tasks for `onload()`:**

- Registering commands: `this.addCommand(...)`

- Registering ribbon icons: `this.addRibbonIcon(...)`

- Registering settings tabs: `this.addSettingTab(...)`

- Registering custom views: `this.registerView(...)`

- Registering editor extensions: `this.registerEditorExtension(...)`

- Registering global events: `this.registerEvent(...)`

- Loading plugin settings: `await this.loadData()`

Performance Optimization (Critical):

The onload() method blocks the app's startup process. A slow onload() method directly contributes to Obsidian feeling slow.

**AVOID in `onload()`:**

- Network requests or data fetching.

- Computationally expensive tasks (e.g., indexing the entire vault).

- Reading a large number of files.

The `onload()` method should be _fast_ and contain _registrations_ only.

### The `onunload()` Method: Resource Management

`async onunload()`: This method is called when the plugin is disabled (toggled off).

Its sole purpose is to _clean up_ any resources, listeners, or intervals created in `onload()` to prevent memory leaks and performance degradation.

**Mandatory Cleanup**:

- If `setInterval` was used, it _must_ be cleared with `clearInterval`.

- If a `MutationObserver` was created, it _must_ be disconnected.

- Any manually-added global event listeners or DOM elements must be removed.

Automatic Cleanup:

Methods provided by the Plugin class, such as this.addCommand(), this.addRibbonIcon(), this.registerView(), and this.registerEvent(), are automatically cleaned up by Obsidian when the plugin is unloaded. This "Registration/Cleanup" contract means it is always safer to use these helper methods, as they prevent common resource leak errors.

### Deferred Execution: `onLayoutReady`

For tasks that _must_ run at startup but are too _slow_ for `onload()`, the correct pattern is to use `onLayoutReady`.

This is an event that fires _after_ the UI is loaded and all `onload()` methods have completed. Register it in `onload()`:

```TypeScript
import { Plugin } from 'obsidian';

export default class ExamplePlugin extends Plugin {
  async onload() {
    this.app.workspace.onLayoutReady(async () => {
      // This is the correct place for a "long Promise chain"
      // or other expensive startup tasks.
    });
  }
}
```

### Accessing Plugin Data (`data.json`)

Plugins can store their own settings and data in a `data.json` file located in their plugin folder (e.g., `.obsidian/plugins/my-plugin/data.json`).

- `await this.loadData()`: Asynchronously loads and parses `data.json`, returning the data object (or `null`).

- `await this.saveData(data: any)`: Asynchronously saves (and serializes) the `data` object to `data.json`.

These methods are the _only_ correct and supported way to access the `data.json` file. Do not use the `Adapter` API or Node.js `fs` for this purpose.

## V. API Reference: The Vault (Data Layer)

This section details the `Vault` API (`this.app.vault`), which is the primary interface for interacting with the user's files and folders (notes, images, PDFs, etc.). This is the API for the _Data Layer_.

### Accessing the Vault

The `Vault` object is available on the plugin instance: `this.app.vault`.

### Reading Files

- `cachedRead(file: TFile): Promise<string>`: Reads a plaintext file. This is the _preferred_ method. It reads from an in-memory cache, which is much faster. It behaves identically to `read()` if the cache is stale.

- `read(file: TFile): Promise<string>`: Reads a plaintext file directly from disk. Use this _only_ if you specifically need to bypass the cache to check for external modifications.

- `readRaw(file: TFile): Promise<ArrayBuffer>`: Reads a binary file (e.g., image, PDF) as an `ArrayBuffer`.

### Writing and Modifying Files

- `create(path: string, data: string): Promise<TFile>`: Creates a new plaintext file at `path` with `data`.

- `modify(file: TFile, data: string): Promise<void>`: Modifies the _entire_ content of a file. This is a full overwrite.

- `rename(file: TAbstractFile, newPath: string): Promise<void>`: Renames a file or folder.

- `delete(file: TAbstractFile): Promise<void>`: Deletes a file or folder.

### File and Folder Discovery

- `getFiles(): TFile`: Returns a flat array of _all_ `TFile` objects in the vault.

- `getMarkdownFiles(): TFile`: A convenient subset of `getFiles()`, returning only Markdown (`.md`) files.

- `getAbstractFileByPath(path: string): TAbstractFile | null`: Resolves a string path (e.g., `Notes/My Note.md`) to a `TFile` or `TFolder` object. This is essential for converting a path into a file object that can be passed to `read()` or `modify()`.

- `getRoot(): TFolder`: Returns the root folder (`TFolder`) of the vault.

### Working with Metadata (Frontmatter)

While it is possible to use `vault.read()` and `vault.modify()` to change YAML frontmatter, this is **not** the recommended practice. It is not an atomic operation and can create race conditions if two plugins attempt to modify the same file.

**Best Practice**: Use `this.app.fileManager.processFrontMatter(file: TFile, fn: (frontmatter: any) => void): Promise<void>`.

This method atomically reads, modifies, and saves the YAML frontmatter, ensuring no conflicts. The `fn` is a callback that receives the parsed frontmatter object, which can be modified directly.

```TypeScript
// SAFE way to modify frontmatter
await this.app.fileManager.processFrontMatter(file, (frontmatter) => {
  if (!frontmatter.tags) {
    frontmatter.tags =;
  }
  frontmatter.tags.push("new-tag");
});
```

### The `Adapter` API: The "Low Level" File System

The `Vault` API intentionally hides certain files (like those starting with `.`, e.g., `.gitignore`) and folders (like `.obsidian`).

To access these hidden files, the `Adapter` API (`this.app.vault.adapter`) must be used.

- `adapter.read(path: string)`: Reads any file (including hidden files) from the file system.

- `adapter.write(path:string, data: string)`: Writes any file (including hidden files).

This is an advanced API and should be used _only_ when the `Vault` API is insufficient.

### `Vault` vs. `Adapter` API Decision Model

This table provides a decision model for which API to use.

|**Use Case**|**Correct API**|**Method**|**Rationale**|
|---|---|---|---|
|Reading a regular note (`My Note.md`)|`Vault`|`app.vault.cachedRead(file)`|Uses Obsidian's cache; this is the fast, standard method.|
|Reading a binary file (`image.png`)|`Vault`|`app.vault.readRaw(file)`|Handles `ArrayBuffer` for binary data.|
|Reading a hidden file (`.stignore`)|`Adapter`|`app.vault.adapter.read('.stignore')`|The `Vault` API cannot "see" files starting with `.`.|
|Reading plugin data (`data.json`)|`Plugin`|`this.loadData()`|The _only_ supported way. Using `Adapter` is incorrect and will fail.|
|Accessing files in `.obsidian/`|`Adapter`|`app.vault.adapter.read(...)`|The `.obsidian` folder is hidden from the `Vault` API.|

## VI. API Reference: The Editor (Text Layer)

This section details how to interact with the _active text editor_. This API is distinct from the `Vault` API, as it deals with the in-memory CodeMirror 6 (CM6) editor instance—the _Text Layer_.

There is a "layered" model for editor interaction. The task's complexity dictates which layer to use.

### Layer 1: The `Editor` Abstraction Layer

This is a high-level API that bridges CM6 and (legacy) CM5. It is used for simple, command-based interactions.

Accessing the Editor:

The Editor object is not global; it must be retrieved from the active view.

```TypeScript
import { Plugin, MarkdownView } from 'obsidian';

// Inside a command callback or other function
const view = this.app.workspace.getActiveViewOfType(MarkdownView);
if (view) {
  const editor = view.editor;
  
  // Now you can use the editor
  editor.replaceSelection("Hello!");
}
```

**Key `Editor` Methods**:

- `getCursor(): EditorPosition`

- `setCursor(pos: EditorPosition)`

- `getSelection(): string`

- `replaceSelection(text: string)`

- `getLine(n: number): string`

- `getValue(): string`: Gets the _entire_ content of the editor's in-memory buffer.

- `setValue(content: string)`: Sets the _entire_ content of the editor's buffer.

### Layer 2: CodeMirror 6 (CM6) Extensions

For rich, "live," and syntax-aware interactions (e.g., custom syntax highlighting, inline widgets, code folding), the `Editor` API is insufficient. A CodeMirror 6 Extension must be used.

An "Obsidian editor extension" _is_ a "CodeMirror 6 extension".

Registering an Extension:

This is done in onload() using this.registerEditorExtension(extension: Extension). The extension is an object imported from the @codemirror packages.

**Key CM6 Concepts**:

- `ViewPlugin`: A CM6 class that "views" the editor state and can add `Decorations`.

- `Decorations`: How plugins "paint" on the editor, (e.g., adding CSS classes, inline widgets, or replacing text visually).

- `syntaxTree`: The parsed Markdown tree. This allows a plugin to find all "links" or "headings" programmatically.

The `obsidian-cm6-attributes` repository is a key reference for building a `ViewPlugin` that parses the `syntaxTree` to apply `Decorations`.

### Layer 3: Responding to Editor Changes

To run code _every time the user types_, a plugin must listen to an event.

`app.workspace.on('editor-change', (editor: Editor, info: MarkdownView) => {... })`

This event is triggered on _every_ change in the editor.

**Warning**: This is a high-risk, high-reward API. The callback fires constantly (e.g., on every keystroke). Any code in this listener _must_ be synchronous, non-blocking, and computationally trivial to avoid UI lag. Any complex logic must be debounced or offloaded.

## VII. Implementing User Interface Components

This section is a catalog of the standard UI elements a plugin can create. All registrations should occur in `onload()`. The Obsidian UI API is _declarative_: the plugin _registers_ a component, and Obsidian (the `Workspace`) handles rendering it. Manually manipulating the DOM to add UI is not supported and will break.

### 1. Commands

- **How**: `this.addCommand(command: Command)`.

- **Purpose**: Adds an action to the Command Palette (Ctrl/Cmd+P) and allows users to assign hotkeys.

- **Key Parameters**:

  - `id`: A unique string ID for the command.

  - `name`: The human-readable name in the palette.

  - `callback`: The function to execute.

  - `hotkeys`: (Optional) An array of default hotkeys.

- **Best Practice**: _Avoid_ setting default `hotkeys`. This causes conflicts with other plugins and user settings. The user should be responsible for assigning their own hotkeys.

```TypeScript
this.addCommand({
  id: 'my-command',
  name: 'My Example Command',
  callback: () => {
    console.log('Command executed!');
  }
});
```

### 2. Ribbon Icons

- **How**: `this.addRibbonIcon(icon: IconName, title: string, callback: (evt: MouseEvent) => any)`.

- **Purpose**: Adds a new icon to the left-hand sidebar (the "ribbon").

- **Icons**:

  - `icon`: Can be a built-in icon name (from the Lucide icon set) or a custom icon ID.

  - **Custom SVG Icons**: To use a custom icon, it must first be registered with `addIcon(iconId: string, svgContent: string)`. The `svgContent` is _only_ the inner `<path>` or `<circle>` elements, _not_ the surrounding `<svg>` tag.

```TypeScript
// Add a built-in icon
this.addRibbonIcon('dice', 'My Plugin Action', (evt: MouseEvent) => {
  console.log('Ribbon icon clicked');
});

// Add a custom SVG icon
addIcon('circle', '<circle cx="50" cy="50" r="50" fill="currentColor" />');
this.addRibbonIcon('circle', 'My Custom Icon', () => {});
```

### 3. Modals (Pop-up Windows)

- **How**: Create a class that extends `Modal`, then open it with `new ExampleModal(this.app).open()`.

- **Core Methods**:

  - `constructor(app: App)`: Call `super(app)`.

  - `onOpen()`: Called when the modal opens. This is where the modal's content is built using `this.contentEl`.

  - `onClose()`: Called when the modal closes. Clean up any resources here.

- **Building Inputs**: Use the `Setting` helper class (the same class used for settings tabs) to build the UI inside `onOpen()`.

- **Specialized Modals**:

  - `SuggestModal`: For a list where the user can select one item.

  - `FuzzySuggestModal`: Provides built-in fuzzy search for a list of items.

```TypeScript
import { App, Modal, Setting } from 'obsidian';

class ExampleModal extends Modal {
  constructor(app: App) {
    super(app);
  }

  onOpen() {
    const { contentEl } = this;
    contentEl.setText('Hello, I am a modal!');
    
    new Setting(contentEl)
     .setName('Name')
     .addText((text) => text.onChange((value) => {
        console.log('Name:', value);
      }));
  }

  onClose() {
    this.contentEl.empty();
  }
}
```

### 4. Settings Tabs

- **How**:

    1. Create a class that extends `PluginSettingTab`.

    2. Implement the `display()` method. This is where the UI is built.

    3. Register the tab in `onload()`: `this.addSettingTab(new ExampleSettingTab(this.app, this))`.

- **Building Settings**: Use the `Setting` helper class inside `display()`.

- **UI Best Practices**:

  - _Do not_ add a top-level heading like "General" or the plugin's name.

  - _Do not_ use the word "settings" in headings (e.g., use "Advanced," not "Advanced settings").

  - Use `new Setting(containerEl).setName("...").setHeading()` for section breaks, not `<h1>` or `<h2>`.

```TypeScript
import { App, PluginSettingTab, Setting } from 'obsidian';

interface MyPluginSettings {
  sampleValue: string;
}

const DEFAULT_SETTINGS: MyPluginSettings = {
  sampleValue: 'default'
}

class ExampleSettingTab extends PluginSettingTab {
  plugin: ExamplePlugin;

  constructor(app: App, plugin: ExamplePlugin) {
    super(app, plugin);
    this.plugin = plugin;
  }

  display() {
    const { containerEl } = this;
    containerEl.empty();

    new Setting(containerEl)
     .setName('Sample Value')
     .setDesc('This is an example setting.')
     .addText(text => text
       .setPlaceholder('Enter a value')
       .setValue(this.plugin.settings.sampleValue)
       .onChange(async (value) => {
          this.plugin.settings.sampleValue = value;
          await this.plugin.saveData(this.plugin.settings);
        }));
  }
}
```

### 5. Custom Views (Side Panes and Tabs)

This is the most complex UI component. It creates a new "view type," like the File Explorer or Graph View, which can live in a tab or a side pane.

- **Steps**:

    1. Define a unique `VIEW_TYPE` string (e.g., `export const VIEW_TYPE_EXAMPLE = 'example-view';`).

    2. Create a class that extends `ItemView` (e.g., `export class ExampleView extends ItemView`).

    3. Implement required methods:

        - `getViewType()`: Returns your view type string.

        - `getDisplayText()`: Returns the human-readable name for the tab.

        - `async onOpen()`: Called when the view is opened. Build the UI here using `this.contentEl`.

        - `async onClose()`: Clean up resources.

    4. Register the view in `onload()`: `this.registerView(VIEW_TYPE_EXAMPLE, (leaf) => new ExampleView(leaf))`.

- **Activating the View**: The view must be opened by a command or ribbon icon. This function calls `this.activateView()`.

```TypeScript
// In main.ts, inside onload()
this.registerView(VIEW_TYPE_EXAMPLE, (leaf) => new ExampleView(leaf));

this.addRibbonIcon('dice', 'Activate view', () => {
  this.activateView();
});

// In main.ts, as a method of your Plugin class
async activateView() {
  const { workspace } = this.app;
  let leaf: WorkspaceLeaf | null = null;
  
  // Check if a leaf of this type already exists
  const leaves = workspace.getLeavesOfType(VIEW_TYPE_EXAMPLE);
  if (leaves.length > 0) {
    leaf = leaves;
  } else {
    // Get a new leaf
    leaf = workspace.getLeaf(true); // 'true' opens in a new tab
    await leaf.setViewState({
      type: VIEW_TYPE_EXAMPLE,
      active: true,
    });
  }
  
  // Reveal the leaf
  workspace.revealLeaf(leaf);
}
```

### 6. Status Bar Items

- **How**: `const statusBarItemEl = this.addStatusBarItem()`.

- **Purpose**: Adds a permanent text or icon element to the bottom status bar.

- Use `statusBarItemEl.setText('My Text')` or `setIcon(statusBarItemEl, 'info')`.

### UI Security Best Practices

- **CRITICAL**: _Never_ use `.innerHTML`, `.outerHTML`, or `.insertAdjacentHTML` to add content from a user or a file. This exposes the user to XSS (Cross-Site Scripting) attacks and will cause a plugin to fail review.

- **ALWAYS**: Use the provided DOM builder functions like `createEl('div', { text: 'Hello' })`, `el.empty()`, and `el.setText()`. These functions automatically sanitize the content and are safe.

## VIII. Performance and Advanced Patterns

This section covers critical best practices for writing robust, performant, and mobile-friendly plugins.

### 1. Optimizing Startup Performance

App performance is directly impacted by the cumulative `onload()` time of all installed plugins.

- **Rule**: Defer all non-essential, "heavy" work (indexing, data fetching, network calls) to `onLayoutReady`.

- **Rule**: Keep `onload()` for _registrations only_.

### 2. Handling CPU-Intensive Tasks

If a plugin must perform a heavy calculation (e.g., static site generation, complex data analysis), it _must not_ block the main UI thread.

- **Pattern 1: `setTimeout` (Chunking)**: Break the work into small chunks and yield back to the event loop with `setTimeout(..., 0)`. This improves responsiveness by preventing the UI from freezing, though it does not improve the total computation time.

- **Pattern 2: Web Workers**: For true parallel processing, a `Worker` must be used.

  - **CRITICAL CONSTRAINT**: Obsidian's environment does _not_ support Node.js `worker_threads`. Attempting to use them will fail.

  - The plugin _must_ use the _Browser-compatible_ `Worker` class.

  - This requires the build tool (e.g., `esbuild`) to be configured to output a separate, browser-compatible worker script.

### 3. Mobile Development Considerations

Obsidian Mobile is a first-class citizen, and most plugins are mobile-compatible.

- **The Main Limitation**: No Node.js, no Electron. Any plugin using `fs`, `crypto`, `os`, etc., is desktop-only.

- **The `isDesktopOnly` Flag**: The `manifest.json` _must_ be set to `true` if Node APIs are used. The code-planning agent must identify this requirement at the beginning of its planning.

- **Debugging Mobile**:

  - **Android**: Enable USB Debugging in device settings, connect to a desktop, and navigate to `chrome://inspect` in a Chromium browser.

  - **iOS (16.4+)**: Use a macOS computer and the Web Inspector in Safari.

### 4. Inter-Plugin Communication

Plugins can expose an API for other plugins to use, and can call other plugins' APIs.

- Accessing another plugin's API:

    const otherPluginApi = this.app.plugins.plugins["plugin-id"]?.api;

- This is not a formal system and depends on the target plugin _explicitly_ exposing an `api` object on its `Plugin` instance.

- For example, the MetaEdit plugin exposes its API at `app.plugins.plugins["metaedit"].api`.

## IX. Releasing and Submitting the Plugin

This section provides the checklist for publishing a plugin to the official Obsidian Community Plugin store. This is a decoupled, git-native, asset-based system.

### 1. Pre-Submission Requirements

Before the first submission, the plugin's public GitHub repository must contain:

- **`README.md`**: A file in the root that clearly explains the plugin's purpose and usage.

- **`LICENSE`**: A file in the root containing an open-source license (e.g., MIT).

- **`manifest.json`**: The manifest file must be in the root of the repo.

### 2. Versioning and Release Creation

When publishing a new version, the following steps are required.

1. **Update `manifest.json`**: Change the `version` field to the new version number (e.g., `1.0.1`).

2. **Update `versions.json` (Recommended)**: Add the new version and its corresponding `minAppVersion` to `versions.json` for backward compatibility.

3. **Create GitHub Release**: Go to the repository's "Releases" page and create a new release.

    - **CRITICAL**: The "Tag version" _must_ exactly match the `version` in `manifest.json` (e.g., `1.0.1`, _not_ `v1.0.1`).

4. **Attach Binary Assets**: Upload the compiled files as _binary attachments_ to the GitHub release.

    - `main.js` (**Required**)

    - `manifest.json` (**Required**)

    - `styles.css` (Optional, if used)

5. **Publish Release**: Publish the release on GitHub.

Obsidian's backend will _not_ detect the new version until these assets are attached to a tagged release.

### 3. The Submission Process (First-Time Only)

To get the plugin into the community store, a formal Pull Request (PR) is required.

1. **Fork** the `obsidianmd/obsidian-releases` repository on GitHub.

2. **Edit** the `community-plugins.json` file in the fork.

3. **Add** the plugin's repository identifier (e.g., `"user-name/repo-name"`) to the _end_ of the JSON list.

4. **Create a Pull Request** from the fork to the `obsidianmd/obsidian-releases` repository.

5. **Fill out** the PR template, including the checklist, confirming all guidelines have been followed.

### 4. The Review Process

The PR will be reviewed by a bot and then by human reviewers. This is a human-gated compliance check.

**Common Rejection/Failure Points**:

- **Using Private APIs**: Using any part of `app` not in the `obsidian-api` definitions.

- **Security Vulnerabilities**: Using `innerHTML`, `outerHTML`, etc..

- **Resource Leaks**: Failing to clean up resources (intervals, observers) in `onunload()`.

- **Hotkey Conflicts**: Setting a default `hotkey` for a command.

- **UI Guideline Violations**:

  - Using `<h1>`, `<h2>`, etc. in settings (use `setHeading()` instead).

  - Adding a top-level heading in the settings tab.

  - Using the word "settings" in settings headings.

  - Using Title Case instead of Sentence case in UI text.

- **Poor Code Clarity**: Code is unreadable, obfuscated, or not formatted.

An agent's "review code" function must be augmented with a "compliance linter" that checks for these "soft" UI and best-practice rules, as they are mandatory for passing the human review.

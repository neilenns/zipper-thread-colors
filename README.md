# YKK zipper to thread color guide

Visual representation of data in Wawak's [zipper to thread color selection guide](https://www.wawak.com/490246/globalassets/documents/waw_pim/nz3/zipper-to-thread-color-selection-guide), plus the Gutermann Sew-All colors where available.

## Contributing

This repository is designed to work in a Visual Studio Code devcontainer. Clone the repo directly into a devcontainer and everything will be set up automatically.

After creating the devcontainer, F5 will launch the site for local development.

## Adding a new color to an existing thread

1. Create a 1:1 aspect ratio .webp image of the thread and name it the SKU for the thread.
2. Put the image in the appropriate folder under `public/images`.
3. Add the thread to the `data/colormappings.json` file. Each zipper has its own entry, and the properties under the zipper correspond to each of the supported thread types.

## Adding a new thread to the system

1. Edit `threads.json` to define the new thread. The `link` property should be the URL up to the point where the SKU should get appended.
2. Add a new folder to `public/images` that matches the id of the new thread.
3. Edit `src/content.config.ts` and add the thread id as a property to the `colorMappings` collection.
4. Add the individual colors following the previous section steps for adding a new color to an existing thread.

## Deploying

The site is deployed as a Cloudflare worker. Deployments happen automatically on pull requests to [the dev deployment site](https://threads-dev.badcasserole.com/) for validation. A GitHub release triggers deployment to [the production site](https://threads.badcasserole.com/).

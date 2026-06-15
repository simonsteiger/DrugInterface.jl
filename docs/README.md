# DrugInterface docs

## Full build

    julia -tauto --project=DrugInterface/docs DrugInterface/docs/make.jl

## Fast local preview loop

1. In `make.jl`, temporarily set `build_vitepress = false` inside
   `MarkdownVitepress(...)`. This makes `makedocs` emit markdown only.
2. Regenerate content:

       julia -tauto --project=DrugInterface/docs DrugInterface/docs/make.jl

3. Start the hot-reload dev server (long-running; run in a background shell):

       julia --project=DrugInterface/docs -e 'using DocumenterVitepress; DocumenterVitepress.dev_docs("DrugInterface/docs/build")'

   The server prints a `http://localhost:PORT/` URL. `dev_docs` expects the
   `build` directory and appends `/.documenter` itself.
4. Edit files under `docs/src/`, re-run step 2, and refresh the browser. If the
   page does not update after content changed, restart `dev_docs`.

## Before committing / CI

Restore `build_vitepress = true` (or remove the override) so release builds run
the full VitePress pipeline.

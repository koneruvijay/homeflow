"""Consume `file.classified` → run pipeline stages → publish `document.indexed`.

Stages run in order; set PIPELINE_STAGES to run a subset in a given deployment
(e.g. scale the converter separately from the embedder).
"""
from homeflow_processor.stages import chunk, convert, embed_store, redact

PIPELINE = [convert, redact, chunk, embed_store]


def main() -> None:
    ...


if __name__ == "__main__":
    main()

# services/intake — validation + classification

Consumes `file.uploaded`, runs LangChain validation and classification chains,
publishes `file.classified` (or marks the file rejected).

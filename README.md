# Differential Context Adaptor
Toolset for Agent-Based LLM inference with high context specificity

**Planned Features and Capabilities**
- Input digester
  - Main: Text & Code
  - Format conversion and equalization
  - web-source, web-soruce with sub pages, web-scraping
  - pdf, epub, etc.
  - text-encoding formats in various file-extensions.
  - Text or code formatted as json, xml, or other other wrappers
  - Image OCR
  - Image feature extractor to NL vector embeddings (using CLIP model etc.)
  - Large input smart-partitioning
  - Expose function, parameters and return values to ai-agent
- LLM handles
  - OpenAI API
  - Huggingface API
  - Local model inference API
  - Local model direct run
- Storing extracted features into a session-agnostic database
  - Choosing various DB libraries
  - Cloud DB provider
  - Storing in json
  - DB Entries contain input text, summary, prompt for digest, context reference, ai-agent role, session and timestamp, other information that illuminate the attention-modus by which the entry was digested
- Feature retriever
  - Retrieve and use previously digested information in order to provide assistance within that context
  - ai-agents can retrieve varrious entries and vector embeddings, such that they take on roles of specialists in various parts of the context-material
# Differential Context Adaptor
Toolset for Agent-Based LLM inference with high context specificity

## Planned Features and Capabilities
- Input digester
  - Main: Text & Code
  - Format conversion and equalization
  - web-source, web-source with sub pages, web-scraping
  - pdf, epub, etc.
  - text-encoding formats in various file-extensions.
  - Text or code formatted as json, xml, or other wrappers
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
  - Storing in json format
  - DB Entries contain input text, summary, prompt for digest, context reference, ai-agent role, session and timestamp, other information that illuminate the attention-modus by which the entry was digested
- Feature retriever
  - Retrieve and use previously digested information in order to provide assistance within that context
  - ai-agents can retrieve varrious entries and vector embeddings, such that they take on roles of specialists in various parts of the context-material

## References & Related Frameworks
### Agent Projects
- [Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)
- [OpenBMB/ChatDev](https://github.com/OpenBMB/ChatDev)

### Agent Frameworks
- [daveshap/ACE_Framework](https://github.com/daveshap/ACE_Framework)
- [microsoft/autogen](https://github.com/microsoft/autogen)
- [langchain-ai/langchain](https://github.com/langchain-ai/langchain)

### Model Inference
- [openai/openai-cookbook](https://github.com/openai/openai-cookbook)
- [facebookresearch/llama](https://github.com/facebookresearch/llama)
- [facebookresearch/llama-recipes](https://github.com/facebookresearch/llama-recipes/)
- [Huggingface Model Inference API](https://huggingface.co/docs/api-inference/index)
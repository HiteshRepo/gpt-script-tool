# GPTScript Tool Collection

A collection of GPTScript tools for automation, data processing, and API integrations. Built while learning GPTScript from the official documentation at https://docs.gptscript.ai/, with some additional tools beyond what's covered in the docs.

## Quick Start

```bash
# Install requirements
make install-requirements

# Run demos
make run-github-demo       # GitHub CLI integration
make run-api-demo          # Weather API demo  
make run-local-files-demo  # Data processing demo
make run-tweets-workflow   # Twitter summarization
make suggest-commands      # Analyze repo and suggest commands

# Get help
make help
```

## Project Structure

```
├── tools/                # GPTScript tools organized by category
│   ├── github/           # GitHub CLI integrations
│   ├── data-processing/  # File and data processing
│   ├── repo-analysis/    # Repository analysis and command suggestions
│   ├── social/           # Social media tools
│   └── weather/          # Weather and environmental data
├── sample-data/          # Test data for demos
├── scripts/              # Setup and build scripts
├── support/              # Supporting utilities
└── docs/                 # Detailed documentation
```

## Available Tools

| Category | Tool | Description |
|----------|------|-------------|
| **Github** | github.gpt | GitHub CLI integration |
| **Github** | git-commit.gpt | Git commit message generator |
| **Github** | code-reviewer.gpt | Code review tool for GitHub PRs |
| **Data** | local-files.gpt | Process CSV, JSON, PDF, Excel files |
| **Data** | context-tool.gpt | Workspace context provider |
| **Repo Analysis** | repo-command-suggester.gpt | Analyze repo state and suggest commands |
| **Social** | tweets-workflow.gpt | Twitter content summarization |
| **Weather** | weather-tool.gpt | WeatherStack API integration |

## Documentation

- **[Complete Documentation](docs/README.md)** - Detailed project overview
- **[Usage Examples](docs/tool-usage-examples.md)** - Step-by-step tool usage guides

## Why This Structure Works

- **Organized by Function**: Tools are grouped by what they do
- **Easy to Extend**: Adding new tools is straightforward  
- **Maintainable**: Related files are kept together
- **Well-Documented**: Each tool has examples and documentation
- **Simple to Use**: Common operations have Makefile shortcuts

## Development

To add a new tool:
1. Create the `.gpt` file in the appropriate `tools/` subdirectory
2. Add a Makefile target in `Makefile`
3. Update documentation in `docs/`
4. Test with sample data

## Requirements

- GPTScript
- Bash 5.2+
- Various API keys (for specific tools)

Run `make install-requirements` for automated setup.

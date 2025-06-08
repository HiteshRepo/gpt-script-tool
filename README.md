# GPTScript Tool Collection

A well-organized collection of GPTScript tools for automation, data processing, and API integrations.

## 🚀 Quick Start

```bash
# Install requirements
make install-requirements

# Run demos
make run-cli-demo          # GitHub CLI integration
make run-api-demo          # Weather API demo  
make run-local-files-demo  # Data processing demo
make run-tweets-workflow   # Twitter summarization

# Get help
make help
```

## 📁 Project Structure

```
├── tools/                 # GPTScript tools organized by category
│   ├── cli/              # Command-line integrations
│   ├── data-processing/  # File and data processing
│   ├── social/           # Social media tools
│   └── weather/          # Weather and environmental data
├── sample-data/          # Test data for demos
├── scripts/              # Setup and build scripts
├── support/              # Supporting utilities
├── config/               # Configuration files
└── docs/                 # Detailed documentation
```

## 🛠️ Available Tools

| Category | Tool | Description |
|----------|------|-------------|
| **CLI** | cli-demo.gpt | GitHub CLI integration |
| **Data** | local-files.gpt | Process CSV, JSON, PDF, Excel files |
| **Data** | context-tool.gpt | Workspace context provider |
| **Social** | tweets-workflow.gpt | Twitter content summarization |
| **Weather** | weather-tool.gpt | WeatherStack API integration |

## 📖 Documentation

- **[Complete Documentation](docs/README.md)** - Detailed project overview
- **[Usage Examples](docs/tool-usage-examples.md)** - Step-by-step tool usage guides

## 🎯 Benefits of This Structure

- **Organized by Function**: Tools grouped by their primary purpose
- **Scalable**: Easy to add new tools in appropriate categories  
- **Maintainable**: Related files co-located, clear separation of concerns
- **Well-Documented**: Comprehensive documentation and examples
- **Easy to Use**: Simple Makefile commands for common operations

## 🔧 Development

To add a new tool:
1. Create the `.gpt` file in the appropriate `tools/` subdirectory
2. Add a Makefile target in `config/Makefile`
3. Update documentation in `docs/`
4. Test with sample data

## 📋 Requirements

- GPTScript
- Bash 5.2+
- Various API keys (for specific tools)

See `make install-requirements` for automated setup.

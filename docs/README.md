# GPTScript Tool Collection

This project contains various GPTScript tools for automation and data processing tasks.

## Project Structure

```
gpt-script-tool/
├── tools/                          # Main GPTScript tools
│   ├── github/
│   │   ├── github.gpt              # GitHub CLI integration tool
│   │   ├── git-commit.gpt          # Git commit message generator
│   │   ├── code-reviewer.gpt       # Code review tool
│   │   └── .gptgitcommitignore     # Git commit ignore patterns
│   ├── data-processing/
│   │   ├── local-files.gpt         # Data processing tool
│   │   └── context-tool.gpt        # Workspace context tool
│   ├── repo-analysis/
│   │   ├── repo-command-suggester.gpt # Repository analysis tool
│   │   ├── demo.sh                 # Demo script
│   │   └── README.md               # Tool documentation
│   ├── social/
│   │   └── tweets-workflow.gpt     # Twitter summarization workflow
│   └── weather/
│       ├── weather-tool.gpt        # Weather tool with WeatherStack API
│       └── weatherstack.openapi.yaml # OpenAPI specification
├── scripts/                        # Build and setup scripts
│   └── install-requirements.sh     # Installation script
├── support/                        # Supporting Python/utility files
│   └── workspace.py               # Workspace context helper
├── sample-data/                    # Test data for demos
│   ├── key_contacts.txt
│   ├── promotions.pdf
│   └── yoy_sales.xlsx
├── docs/                          # Documentation
│   └── README.md                  # This file
```

## Available Tools

### GitHub Tools
- **github.gpt**: GitHub CLI integration for repository management
- **git-commit.gpt**: Git commit message generator with conventional commit format
- **code-reviewer.gpt**: Code review tool for GitHub pull requests

### Data Processing Tools
- **local-files.gpt**: Process local data files (CSV, JSON, PDF, Excel)
- **context-tool.gpt**: Workspace context provider for file system operations

### Repository Analysis Tools
- **repo-command-suggester.gpt**: Analyze repository state and suggest relevant commands

### Social Media Tools
- **tweets-workflow.gpt**: Twitter content summarization workflow

### Weather Tools
- **weather-tool.gpt**: Weather information using WeatherStack API

## Getting Started

1. Install requirements:
   ```bash
   make install-requirements
   ```

2. Run tool demos:
   ```bash
   make run-github-demo       # GitHub CLI demo
   make run-api-demo          # Weather API demo
   make run-local-files-demo  # Data processing demo
   make run-tweets-workflow   # Twitter summarization demo
   make suggest-commands      # Repository analysis demo
   ```

3. List available commands:
   ```bash
   make help
   ```

## Usage Examples

### Data Processing
```bash
# Process files in sample-data directory
gptscript --workspace=./sample-data tools/data-processing/local-files.gpt
```

### Weather Information
```bash
# Get weather information (requires WeatherStack API key)
gptscript tools/weather/weather-tool.gpt
```

### GitHub Operations
```bash
# GitHub CLI operations
gptscript tools/github/github.gpt

# Generate git commit messages
gptscript tools/github/git-commit.gpt

# Code review on GitHub PRs
gptscript tools/github/code-reviewer.gpt --PR_URL "https://github.com/owner/repo/pull/123"
```

### Repository Analysis
```bash
# Analyze repository and get command suggestions
gptscript tools/repo-analysis/repo-command-suggester.gpt
```

### Tweet Summarization
```bash
# Summarize tweets from specified URLs
gptscript tools/social/tweets-workflow.gpt
```

## Configuration

- **API Keys**: Weather tool requires WeatherStack API key
- **Dependencies**: Install via `make install-requirements`
- **Workspace**: Sample data available in `sample-data/` directory

## Development

To add new tools:
1. Create tool in appropriate `tools/` subdirectory
2. Update `Makefile` with new targets
3. Add documentation to this README

## Tool Categories

- **GitHub**: Git and GitHub integrations
- **Data Processing**: File and data manipulation tools
- **Repository Analysis**: Repository state analysis and command suggestions
- **Social**: Social media platform integrations
- **Weather**: Weather and environmental data tools

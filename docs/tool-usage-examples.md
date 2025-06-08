# Tool Usage Examples

This document provides detailed examples of how to use each tool in the collection.

## CLI Tools

### GitHub CLI Demo (cli-demo.gpt)

**Purpose**: Interact with GitHub repositories using the GitHub CLI

**Usage**:
```bash
gptscript tools/cli/cli-demo.gpt
```

**Example Interactions**:
- List repositories
- Create issues
- Manage pull requests
- View repository information

## Data Processing Tools

### Local Files Assistant (local-files.gpt)

**Purpose**: Process and analyze local data files including CSV, JSON, PDF, and Excel files

**Usage**:
```bash
# Process files in sample-data directory
gptscript --workspace=./sample-data tools/data-processing/local-files.gpt
```

**Supported File Types**:
- **CSV files**: Query, filter, and analyze tabular data
- **Excel files**: Read and process spreadsheet data
- **PDF files**: Extract and analyze text content
- **JSON files**: Parse and query structured data

**Example Tasks**:
- "Analyze the sales data in yoy_sales.xlsx"
- "Extract contact information from key_contacts.txt"
- "Summarize the content of promotions.pdf"

### Workspace Context Tool (context-tool.gpt)

**Purpose**: Provides workspace context and file system operations

**Usage**: Typically used as a dependency by other tools
```bash
# Used internally by local-files.gpt
Context: ./context-tool.gpt
```

## Social Media Tools

### Twitter Workflow (tweets-workflow.gpt)

**Purpose**: Summarize tweets and extract hyperlinks from Twitter URLs

**Usage**:
```bash
gptscript tools/social/tweets-workflow.gpt
```

**Features**:
- Summarizes tweets in markdown format
- Extracts and summarizes hyperlinks from tweets
- Processes tweets synchronously in order
- Outputs summaries to `tweets.md`

**Current Configuration**:
- Processes specific tweet URLs (can be modified in the tool)
- Generates structured markdown output with references

## Weather Tools

### Weather Bot (weather-tool.gpt)

**Purpose**: Get weather information using WeatherStack API

**Prerequisites**:
- WeatherStack API key (set as environment variable)

**Usage**:
```bash
gptscript tools/weather/weather-tool.gpt
```

**Features**:
- Current weather conditions
- Weather forecasts
- Location-based weather data
- Interactive confirmation before API calls

**Setup**:
1. Get API key from WeatherStack
2. Set environment variable: `WS_API_KEY=your_api_key`
3. Run the tool

## Advanced Usage

### Chaining Tools

You can create workflows that combine multiple tools:

```bash
# Example: Process data then generate weather report
gptscript --workspace=./sample-data tools/data-processing/local-files.gpt
# Then use the processed data with other tools
```

### Custom Workspaces

Use different data directories:

```bash
# Use custom data directory
gptscript --workspace=/path/to/your/data tools/data-processing/local-files.gpt
```

### Makefile Shortcuts

Use the provided Makefile for common operations:

```bash
# Install all requirements
make install-requirements

# Run specific demos
make run-cli-demo
make run-api-demo
make run-local-files-demo
make run-tweets-workflow

# List WeatherStack API operations
make ws-list-ops

# Get help
make help
```

## Troubleshooting

### Common Issues

1. **Missing Dependencies**: Run `make install-requirements`
2. **API Key Issues**: Ensure environment variables are set correctly
3. **File Path Issues**: Use absolute paths or ensure correct working directory
4. **Permission Issues**: Check file permissions for scripts

### Debug Mode

Add verbose output to any tool:
```bash
gptscript --verbose tools/cli/cli-demo.gpt
```

## Extending Tools

### Adding New Tools

1. Create tool file in appropriate `tools/` subdirectory
2. Add Makefile target in `config/Makefile`
3. Update documentation
4. Test with sample data

### Tool Structure

Each GPTScript tool should include:
- Clear name and description
- Required tools and dependencies
- Parameter definitions
- Usage instructions

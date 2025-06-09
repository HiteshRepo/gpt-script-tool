# Interview Analysis Tool

This tool provides automated analysis of technical interview transcripts to help hiring managers make informed decisions about candidates.

## Overview

The `interview-judgementor.gpt` tool evaluates candidates across four key criteria:
- **Communication**: Clarity, articulation, and professional engagement
- **Algorithms Knowledge**: Problem-solving approach and optimization understanding
- **Data Structures**: Knowledge of appropriate structures and trade-offs
- **Cloud-Native Technologies**: Experience with containers, cloud platforms, and DevOps

## Files

- `interview-judgementor.gpt` - Main GPT script for interview analysis
- `directory-traverser.gpt` - Tool for traversing directories to find interview files
- `file-reader.gpt` - Tool for reading and processing text files
- `README.md` - This documentation file

## Sample Data

The tool works with the following sample files in `../../sample-data/`:
- `interview_transcript.txt` - Complete interview transcript
- `basic_dsa_interview_questions.md` - Technical questions asked during interview
- `interview_expectations.md` - Evaluation criteria and requirements

## Usage

### Method 1: Directory Parameter (Recommended)
```bash
gptscript interview-judgementor.gpt --directory ../../sample-data
```
The tool will automatically traverse the directory, find all interview-related files, and analyze them.

### Method 2: Interactive Chat Mode
1. **Run the GPTScript tool**:
   ```bash
   gptscript interview-judgementor.gpt
   ```

2. **Ask the assistant to analyze a directory**:
   ```
   Please analyze the interview materials in ../../sample-data directory
   ```

3. **Get structured feedback** with detailed analysis and recommendations

## Architecture

The tool uses a modular architecture:
1. **Main Tool** (`interview-judgementor.gpt`) - Orchestrates the analysis process
2. **Directory Traverser** (`directory-traverser.gpt`) - Finds interview files in directories
3. **File Reader** (`file-reader.gpt`) - Reads and processes individual files

## Output Format

The tool provides:
- **Detailed Assessment**: Pros and cons for each criterion with specific examples
- **Overall Summary**: Brief performance overview
- **Final Recommendation**: YES/NO hiring decision with reasoning

## Example Analysis

Based on the sample transcript, the tool evaluates:
- How well the candidate explained their blockchain and Go experience
- Their approach to the merge sorted arrays problem
- Their understanding of goroutines and channels
- Their knowledge of Docker, Kubernetes, and cloud platforms

## Demo

Run the demo script to see usage instructions:
```bash
./demo.sh
```

## Integration

This tool can be integrated into hiring workflows to:
- Standardize interview evaluations
- Reduce bias in candidate assessment
- Provide consistent feedback across interviewers
- Document hiring decisions with specific examples

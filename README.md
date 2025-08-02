# Introduction

Code agents like Claude Code, Gemini CLI exhibits impressive
capabilities to solve complex programming tasks. However, running these
code agents directly on the host environment poses significant risks
like data loss, privacy leak due to exposing sensitive data to the
agent. The project creates sandbox to minimise these riks for
developers using Mac (Intel or Apple chips) and AI coding assistants
like Claude Code, Gemini CLI using the Ubuntu 24.04.

# Setup

This project requires:

- homebrew: package manager to automate software installation under MacOS
- limavm: lightweight virtual machine manager
- xquartz: X Server to display GUI applications running in the vm

You need install homebrew before setup this project. Then run the
`setup-box.sh` script to install limavm and create the sandbox for coding
agent with claude code and gemini cli pre-installed.

# Enable GUI applications

If you which to run GUI applications inside the VM, you run the `setup-x.sh`
script first. This script sets up X Window system on MacOS by using the xquartz
package.

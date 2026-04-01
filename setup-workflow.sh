#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="${SCRIPT_DIR}/workflow-template"
TARGET_DIR="${1:-$(pwd)}"

SOURCE_CURSOR_DIR="${TEMPLATE_DIR}/.cursor"
SOURCE_PROJECT_FILE="${TEMPLATE_DIR}/PROJECT.md"
TARGET_CURSOR_DIR="${TARGET_DIR}/.cursor"
TARGET_PROJECT_FILE="${TARGET_DIR}/PROJECT.md"

usage() {
  echo "Usage: $(basename "$0") [target-project-path]"
  echo
  echo "Examples:"
  echo "  $(basename "$0")"
  echo "  $(basename "$0") /path/to/my-project"
}

confirm_overwrite() {
  local path="$1"
  local prompt="$2"
  read -r -p "${prompt} (${path}) [y/N]: " reply
  case "${reply}" in
    y|Y|yes|YES) return 0 ;;
    *) return 1 ;;
  esac
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -d "${TEMPLATE_DIR}" ]]; then
  echo "Error: workflow template not found at: ${TEMPLATE_DIR}"
  exit 1
fi

if [[ ! -d "${SOURCE_CURSOR_DIR}" || ! -f "${SOURCE_PROJECT_FILE}" ]]; then
  echo "Error: template is incomplete. Expected:"
  echo "  - ${SOURCE_CURSOR_DIR}"
  echo "  - ${SOURCE_PROJECT_FILE}"
  exit 1
fi

if [[ ! -d "${TARGET_DIR}" ]]; then
  echo "Error: target directory does not exist: ${TARGET_DIR}"
  exit 1
fi

mkdir -p "${TARGET_CURSOR_DIR}"

if [[ -d "${TARGET_CURSOR_DIR}/rules" ]]; then
  if confirm_overwrite "${TARGET_CURSOR_DIR}/rules" "rules already exist. Overwrite"; then
    rm -rf "${TARGET_CURSOR_DIR}/rules"
  else
    echo "Skipped copying rules."
  fi
fi

if [[ ! -d "${TARGET_CURSOR_DIR}/rules" ]]; then
  cp -R "${SOURCE_CURSOR_DIR}/rules" "${TARGET_CURSOR_DIR}/"
  echo "Copied: .cursor/rules"
fi

if [[ -d "${TARGET_CURSOR_DIR}/prompts" ]]; then
  if confirm_overwrite "${TARGET_CURSOR_DIR}/prompts" "prompts already exist. Overwrite"; then
    rm -rf "${TARGET_CURSOR_DIR}/prompts"
  else
    echo "Skipped copying prompts."
  fi
fi

if [[ ! -d "${TARGET_CURSOR_DIR}/prompts" ]]; then
  cp -R "${SOURCE_CURSOR_DIR}/prompts" "${TARGET_CURSOR_DIR}/"
  echo "Copied: .cursor/prompts"
fi

if [[ -f "${TARGET_PROJECT_FILE}" ]]; then
  if confirm_overwrite "${TARGET_PROJECT_FILE}" "PROJECT.md already exists. Overwrite"; then
    cp "${SOURCE_PROJECT_FILE}" "${TARGET_PROJECT_FILE}"
    echo "Copied: PROJECT.md"
  else
    echo "Skipped copying PROJECT.md."
  fi
else
  cp "${SOURCE_PROJECT_FILE}" "${TARGET_PROJECT_FILE}"
  echo "Copied: PROJECT.md"
fi

echo
echo "Workflow setup complete in: ${TARGET_DIR}"
echo "Next steps:"
echo "1) Open this project in Cursor"
echo "2) Type: next step"
echo "3) If this is an existing codebase, run: @learn-codebase.md"
echo "4) For UI tasks, import designs first: @import-design.md"

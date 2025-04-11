# Encrypted Tcl Script

This repository provides an automated workflow to encrypt Tcl scripts into TBC (Tcl ByteCode) format using TclPro.

## How It Works

1. Place your `.tcl` script files in the `src` directory
2. When you push changes to the `main` branch, GitHub Actions will automatically:
   - Find all `.tcl` files in the `src` directory
   - Encrypt them to `.tbc` format
   - Create a GitHub release with the encrypted files

## Directory Structure

- `src/`: Place your source Tcl scripts here
- `output/`: The encrypted TBC files will be generated here (by the workflow)
- `.github/workflows/`: Contains the GitHub Actions workflow definition

## Manual Trigger

You can also manually trigger the encryption workflow:

1. Go to the "Actions" tab in your GitHub repository
2. Select the "Encrypt Tcl Scripts" workflow
3. Click "Run workflow"

## Requirements

This workflow uses TclPro 1.4.1 for encryption, which is automatically downloaded from SourceForge during the workflow execution.

## Implementation Details

- The workflow uses Ubuntu 20.04 as the base Docker image
- TclPro 1.4.1 是通过以下步骤自动安装的：
  - 从 SourceForge 下载 TclPro 1.4.1 安装包
  - 使用 expect 脚本自动完成交互式安装过程
  - 安装到 `/opt/tclpro1.4` 目录
- 使用 TclPro 的 `procomp` 工具将 Tcl 脚本加密为 TBC 格式
- 自动创建包含加密后 TBC 文件的 GitHub release

## Important Notes

- TBC files are not fully secure and should not be used for sensitive information
- The workflow is triggered automatically when Tcl files are pushed to the `src` directory
- You can also trigger the workflow manually from the GitHub Actions tab

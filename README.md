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

You can also manually trigger the encryption workflow with custom options:

1. Go to the "Actions" tab in your GitHub repository
2. Select the "Encrypt Tcl Scripts" workflow
3. Click "Run workflow"
4. Configure the following options:
   - **要加密的特定文件路径**: 可以指定要加密的特定文件（例如：`src/example.tcl`），留空则加密所有 `.tcl` 文件
   - **发布名称**: 自定义 GitHub Release 的名称
   - **是否创建 GitHub Release**: 选择是否创建 GitHub Release，如果选择 `false`，加密文件将作为工作流的构件上传
5. Click "Run workflow" to start the encryption process

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
- 手动触发工作流时可以指定以下选项：
  - 加密特定的 Tcl 文件，而不是所有文件
  - 自定义 GitHub Release 的名称
  - 选择是否创建 GitHub Release
- 如果选择不创建 GitHub Release，加密文件将作为工作流的构件保存 30 天

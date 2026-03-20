# Project Vektor

**Project Vektor** 是一个基于 Godot 4.6 引擎开发的 2D 游戏项目，使用 C# 作为主要编程语言，目标框架为 .NET 10。

## 项目概述

这是一个使用 Godot 引擎和 C# 开发的游戏项目。项目目前包含基础的角色控制功能，玩家可以使用键盘进行上下左右移动。

## 技术栈

- **游戏引擎**: Godot 4.6
- **编程语言**: C#
- **目标框架**: .NET 10
- **物理引擎**: Jolt Physics
- **渲染模式**: Forward Plus
- **渲染设备**: Direct3D 12 (Windows)

## 项目结构

```
Project_Vektor/
├── Assets/           # 游戏资源文件 (图片、音频等)
├── Characters/       # 角色相关场景和脚本
├── Scenes/           # 游戏场景文件
├── .editorconfig     # 编辑器配置
├── .gitignore        # Git 忽略文件配置
├── project.godot     # Godot 项目配置
├── project_vektor.csproj  # C# 项目文件
└── project_vektor.sln     # Visual Studio 解决方案文件
```

## 功能特性

### 当前功能
- 基础角色移动控制 (上下左右方向键)
- 使用 Jolt 物理引擎
- 支持多种渲染后端

### 角色控制
- `W` 或 `↑`: 向上移动
- `A` 或 `←`: 向左移动
- `S` 或 `↓`: 向下移动
- `D` 或 `→`: 向右移动

## 开发环境要求

- Godot 4.6 或更高版本
- .NET 10 SDK
- 支持 C# 的 Godot 编译版本

## 项目状态

该项目目前处于早期开发阶段，主要实现了基础的角色移动功能。未来计划添加更多游戏功能。

## 文件说明

- `.godot/` - Godot 编辑器生成的临时文件和缓存
- `.import/` - 导入的资源文件
- `*.import` - 资源导入配置
- `*.uid` - Godot 内部使用的唯一标识符文件

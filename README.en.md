<h1 align="center">🛡️ Windows Integrity Guard</h1>

<p align="center"><em>Windows integrity checking with separate service and interface.</em></p>

<p align="center">🇧🇷 <a href="README.md">Português</a> | 🇺🇸 English</p>

<p align="center"><img src="https://img.shields.io/badge/license-MIT-006bed?style=flat-square" alt="MIT" /> <img src="https://img.shields.io/github/last-commit/Felipe-Amorim-Dev/WindowsIntegrityGuard?style=flat-square&color=006bed" alt="Last commit" /></p>

<p align="center"><a href="#sobre">About</a> • <a href="#tecnologias">Technologies</a> • <a href="#como-rodar">Running locally</a> • <a href="#licenca">License</a> • <a href="#autor">Author</a></p>

---

<a id="sobre"></a>
## 📖 About

Umbrella repository for Windows Integrity Guard. It uses Git submodules to bring together the .NET integrity service and WPF user interface, maintained independently.

## ✨ Features

- Project organization with Git submodules
- Service and UI integration design

## 🛠️ Technologies

![C#](https://img.shields.io/badge/C%23-006bed?style=for-the-badge) ![.NET 9](https://img.shields.io/badge/.NET_9-006bed?style=for-the-badge) ![WPF](https://img.shields.io/badge/WPF-006bed?style=for-the-badge) ![Windows Services](https://img.shields.io/badge/Windows_Services-006bed?style=for-the-badge)

## 📦 Prerequisites

Windows and .NET 9 SDK (.NET desktop workload for WPF).

<a id="como-rodar"></a>
## 🚀 Running locally

```bash
git clone --recurse-submodules https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard.git
cd WindowsIntegrityGuard
git submodule update --init --recursive
```

## 🔗 Related repositories

- [WindowsIntegrityGuard-Service](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-Service) — Serviço de integridade
- [WindowsIntegrityGuard-UI](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-UI) — Interface WPF

## 🏗️ Architecture and components

- Umbrella repository: service and ui are Git submodules.
- Service contains Core contracts and logic, Windows Service host, tests and IPC.
- UI contains WPF screens, ViewModels and Named Pipes client.

### Technical workflow

1. UI → Named Pipes → Service → integrity scanner.
2. The repair engine checks assessment and authorization before invoking SFC/DISM.
3. The interface displays service state and results.

<a id="licenca"></a>
## 📄 License

Distributed under the [MIT license](LICENSE).

<a id="autor"></a>
## 👤 Author

**Felipe Figueiredo Amorim** — Full Stack Developer.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Felipe%20Amorim-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/felipe-amorim-dev/) [![E-mail](https://img.shields.io/badge/E--mail-contato-006bed?style=for-the-badge)](mailto:felipe.f.amorim@outlook.com)

<p align="center"><strong>Obrigado por visitar! / Thanks for visiting!</strong></p>

<h1 align="center">🛡️ Windows Integrity Guard</h1>

<p align="center"><em>Verificação de integridade do Windows com serviço e interface independentes.</em></p>

<p align="center">🇧🇷 Português | 🇺🇸 <a href="README.en.md">English</a></p>

<p align="center"><img src="https://img.shields.io/badge/licen%C3%A7a-MIT-006bed?style=flat-square" alt="MIT" /> <img src="https://img.shields.io/github/last-commit/Felipe-Amorim-Dev/WindowsIntegrityGuard?style=flat-square&color=006bed" alt="Last commit" /></p>

<p align="center"><a href="#sobre">Sobre</a> • <a href="#tecnologias">Tecnologias</a> • <a href="#como-rodar">Como rodar</a> • <a href="#licenca">Licença</a> • <a href="#autor">Autor</a></p>

---

<a id="sobre"></a>
## 📖 Sobre

Repositório agregador do Windows Integrity Guard. Utiliza submódulos Git para reunir o serviço .NET de integridade e a interface WPF. Os componentes são desenvolvidos em repositórios separados.

## ✨ Funcionalidades

- Organização do projeto em submódulos
- Integração planejada entre serviço e interface

## 🛠️ Tecnologias

![C#](https://img.shields.io/badge/C%23-006bed?style=for-the-badge) ![.NET 9](https://img.shields.io/badge/.NET_9-006bed?style=for-the-badge) ![WPF](https://img.shields.io/badge/WPF-006bed?style=for-the-badge) ![Windows Services](https://img.shields.io/badge/Windows_Services-006bed?style=for-the-badge)

## 📦 Pré-requisitos

Windows e SDK .NET 9 (componentes de desktop .NET para WPF).

<a id="como-rodar"></a>
## 🚀 Como rodar

```bash
git clone --recurse-submodules https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard.git
cd WindowsIntegrityGuard
git submodule update --init --recursive
```

## 🔗 Repositórios relacionados

- [WindowsIntegrityGuard-Service](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-Service) — Serviço de integridade
- [WindowsIntegrityGuard-UI](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-UI) — Interface WPF

## 🏗️ Arquitetura e componentes

- Repositório agregador: service e ui são submódulos Git.
- Service contém Core (contratos e lógica), host Windows Service, testes e comunicação IPC.
- UI contém interface WPF, ViewModels e cliente Named Pipes.

### Fluxo técnico

1. UI → Named Pipes → Service → scanner de integridade.
2. O motor de reparo utiliza a classificação do resultado e autorização antes de solicitar SFC/DISM.
3. Resultados e estado do serviço são apresentados na interface.

<a id="licenca"></a>
## 📄 Licença

Distribuído sob a [licença MIT](LICENSE).

<a id="autor"></a>
## 👤 Autor

**Felipe Figueiredo Amorim** — Desenvolvedor Full Stack.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Felipe%20Amorim-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/felipe-amorim-dev/) [![E-mail](https://img.shields.io/badge/E--mail-contato-006bed?style=for-the-badge)](mailto:felipe.f.amorim@outlook.com)

<p align="center"><strong>Obrigado por visitar! / Thanks for visiting!</strong></p>

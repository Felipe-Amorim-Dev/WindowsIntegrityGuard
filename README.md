# Windows Integrity Guard

**Prototype / Em desenvolvimento** — Windows integrity checks and controlled repair workflows written in .NET.

## Repository layout
This repository coordinates two independent components via Git submodules:
- [Service and Core](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-Service): integrity checks, decision logic and repair services.
- [WPF UI](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-UI): Windows desktop interface.

Clone including submodules:

```bash
git clone --recurse-submodules https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard.git
```

## Safety and maturity
This is experimental system-maintenance software. Do **not** run it on production or critical Windows machines without reviewing its source, making backups and validating the behavior in a disposable VM. SFC/DISM invocation and privileged operations can affect system state. Existing code and test files do not prove operational readiness.

## Next steps
Validate service/UI communication, installation and permissions, test a matrix of supported Windows versions, run regression checks and prepare a controlled installation process.

**PT-BR:** Projeto experimental de verificação de integridade do Windows. O serviço e a interface são mantidos em repositórios separados e ligados por submódulos. Não utilizar em máquinas críticas sem revisão e testes.

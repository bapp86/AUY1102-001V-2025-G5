# AUY1102-001V-2025-G5 · Pipeline de Calidad, Pruebas y Seguridad

![Status](https://img.shields.io/badge/CI-GitHub_Actions-informational?logo=githubactions)
![Node](https://img.shields.io/badge/Node.js-%E2%89%A520.x-339933?logo=node.js)
![Tests](https://img.shields.io/badge/Testing-Jest%20|%20NYC-success)
![Lint](https://img.shields.io/badge/Code%20Style-ESLint%20|%20Prettier-blue)
![Security](https://img.shields.io/badge/Security-Enabled-critical)
![Build Status](https://github.com/bapp86/AUY1102-001V-2025-G5/actions/workflows/pipeline_evaluacion.yml/badge.svg)
![Security Scan](https://github.com/bapp86/AUY1102-001V-2025-G5/actions/workflows/codeql-analysis.yml/badge.svg)


Este proyecto cuenta con integración continua (CI) para asegurar la calidad y seguridad del código.

Repositorio del **Grupo G5** para la **Evaluación Parcial N°2** de  
**Ciclo de Vida del Software I – AUY1102-001V-2025 (Sección 001V, DUOC UC)**

Basado en el repositorio oficial: `Fundacion-Instituto-Profesional-Duoc-UC/AUY1102-Pipeline`.

**📄 Informe completo de la evaluación (en formato pdf y sin la necesidad de descarga)**:
[Visualizar Informe AUY1102-001V-2025-G5](docs/AUY1102-001V-2025-G5.pdf)

---

## 📌 1. Propósito del Proyecto

Este repositorio consolida la implementación de un **pipeline profesional de Integración Continua (CI)** que integra:

- Ejecución automatizada de pruebas unitarias.
- Medición de cobertura con NYC.
- Linting y formateo consistente del código.
- Análisis de calidad y seguridad.
- Buenas prácticas de versionamiento, ramas y Pull Requests.
- Publicación y empaquetado alineado con **GitHub Packages / NPM Registry**.

El objetivo es demostrar competencias del **RA3** de la asignatura, simulando un entorno real de DevSecOps académico-profesional.

---

## 🧱 2. Contexto y Repositorio

- **Nombre del repositorio:** `AUY1102-001V-2025-G5`
- **URL:** `https://github.com/bapp86/AUY1102-001V-2025-G5`
- Creado a partir del proyecto base proporcionado por la institución.
- Metadatos alineados en `package.json`:
  - `"name": "auy1102-001v-2025-g5"`
  - `"repository.url": "https://github.com/bapp86/AUY1102-001V-2025-G5.git"`
  - `"author": "bapp86 - AUY1102-001V-2025-G5"`

---

## 🛠️ 3. Stack Tecnológico

**Lenguaje & Runtime**

- Node.js (mínimo recomendado: `>= 20.x`)
- TypeScript & JavaScript

**Herramientas Clave**

- Jest · NYC (coverage)
- ESLint · Prettier
- Husky · Commitlint · Lint-staged
- Semantic Release (configurado)
- GitHub Actions (workflows de CI/CD)
- Integraciones listas para:
  - CodeQL
  - Escaneo de dependencias (SCA)
  - Publicación en NPM Registry / GitHub Packages

---

## 📂 4. Estructura Principal del Repositorio

```
AUY1102-001V-2025-G5/
├─ .github/
│  ├─ workflows/        # Pipelines de CI/CD (tests, auditorías, etc.)
│  └─ ...               # Configuración adicional del proyecto
├─ .husky/              # Hooks de Git (ej. lint en pre-commit)
├─ docs/                # Documentación y material de apoyo
├─ img/                 # Recursos gráficos (diagramas / evidencias)
├─ src/                 # Código fuente principal del paquete/librería
├─ test/                # Pruebas unitarias y archivos asociados
├─ Dockerfile           # Soporte para contenedores (build / CI)
├─ jest.config.js       # Configuración de Jest
├─ tsconfig*.json       # Configuración de TypeScript
├─ .eslintrc.json       # Configuración de ESLint
├─ .prettierrc.json     # Configuración de Prettier
├─ .releaserc           # Configuración de semantic-release
└─ package.json
```
---

## 🚀 5. Puesta en Marcha

### 5.1. Requisitos
```
Node.js >= 20.x
npm
Git
```
### 5.2. Instalación
```
git clone https://github.com/bapp86/AUY1102-001V-2025-G5.git
cd AUY1102-001V-2025-G5
```
#### Instalación estándar
```
npm install
```
#### Instalación limpia para CI
```
npm ci
```
## ✅ 6. Scripts Disponibles

Los scripts definidos en package.json permiten un flujo homogéneo entre desarrollo local y CI.

### 🔧 6.1. Build & Tipos
```
npm run build       # Compila el proyecto a la salida configurada
npm run types       # Genera definiciones .d.ts si aplica
```
### 🧹 6.2. Calidad de Código
```
npm run lint        # Ejecuta ESLint sobre el código fuente
npm run format      # Aplica formato con Prettier
npm run sort        # Ordena y normaliza el package.json
```
### 🧪 6.3. Pruebas
```
npm run test:unit      # Ejecuta las pruebas unitarias con Jest
npm run test:coverage  # Ejecuta pruebas y genera reporte de cobertura con NYC
npm run test:dev       # Ejecuta pruebas en modo desarrollo
npm run test:watch     # Mantiene Jest en modo watch para desarrollo continuo
```
Estos comandos son la base del pipeline y se integran con los workflows de GitHub Actions.

## 🔐 7. Configuración de conexiones y secrets

Para que los workflows y el pipeline funcionen correctamente, se deben configurar algunos **Secrets** y archivos de configuración. Ninguna credencial debe subirse al repositorio.

### 7.1. GitHub Actions – Secrets recomendados

Configurar en: `Settings → Secrets and variables → Actions → New repository secret`.

| Secret              | Descripción                                                                                | Obligatorio                                 |
|---------------------|--------------------------------------------------------------------------------------------|---------------------------------------------|
| `NPM_TOKEN`         | Token para publicar/instalar desde NPM Registry o GitHub Packages (si se usa publicación). | Opcional                                    |
| `SONAR_TOKEN`       | Token de SonarCloud/SonarQube para análisis de calidad.                                    | Opcional (solo si se activa workflow Sonar) |
| `SONAR_ORG`         | Organización/proyecto usado por SonarCloud.                                                | Opcional                                    |
| `SNYK_TOKEN`        | Token para escaneo de vulnerabilidades con Snyk.                                           | Opcional                                    |
| `GITHUB_TOKEN`      | Usado automáticamente por GitHub Actions (no requiere seteo manual).                       | Sí (automático)                             |

Ajustar los nombres según los que usen tus `.github/workflows/*.yml`.

### 7.2. Configuración local (.npmrc / entorno)

Para desarrollar en local:

1. Si se usa GitHub Packages o un registro privado, crear un archivo `.npmrc` (no subirlo al repo) con algo similar a:

   ```ini
   //npm.pkg.github.com/:_authToken=${NPM_TOKEN}
   @tu-scope:registry=https://npm.pkg.github.com
   ```
2. Si algún script depende de variables de entorno (por ejemplo para integraciones externas), configurarlas en tu entorno local o en un archivo ```.env``` excluido por ```.gitignore```.

### 7.3. Buenas prácticas

- No subir ```.env```, ```.npmrc``` con tokens ni capturas donde se vean credenciales.
- Documentar siempre **qué** secret se necesita y **para qué**, nunca su valor.
- Mantener este apartado actualizado si se agregan nuevos workflows o integraciones.

## 🧪 8. Estrategia de Pruebas

- Implementación de pruebas unitarias con **Jest**, orientadas a validar el comportamiento de componentes clave.

- Uso de **NYC** para calcular cobertura:

  - Foco en archivos dentro de *src/*.

  - Reportes claros para revisión técnica y académica.

- Refuerzo de cobertura mediante casos adicionales sobre la lógica del dominio (Value Objects y funciones específicas).

- Enfoque alineado con buenas prácticas:

  - Detectar regresiones.

  - Asegurar comportamiento estable antes de integrar cambios.

## 🐳 9. Ejecución con Docker

El proyecto está contenerizado y optimizado para producción. Para correrlo localmente:

1. **Construir la imagen:**
   ```bash
   docker build -t mi-app-backend .
   
2. **Ejecutar el contenedor:**
   ```bash
   docker run -p 3000:3000 mi-app-backend

Resultado esperado: La terminal se quedará "quieta" (escuchando) y si vas a http://localhost:3000 verás el mensaje: "¡Hola! El servidor Docker está funcionando correctamente

## 🧹 10. Linting, Formato y Hooks

El proyecto adopta un enfoque de **calidad preventiva**:

- **ESLint**: aplica reglas para mantener estándares consistentes, evitar malas prácticas y mejorar la legibilidad.

- **Prettier**: unifica el estilo de formato para todo el equipo.

- **Husky + Lint-staged** (si está configurado en el repo):

  - Ejecutan validaciones sobre los archivos modificados antes del commit.

  - Evitan que se suba código sin cumplir con las normas del proyecto.

- **Commitlint / Convenciones de commits**:

Facilitan la integración con herramientas como *semantic-release* y la generación de changelogs.

Este conjunto reduce la deuda técnica y fortalece el trabajo colaborativo.

## 🔁 11. Integración Continua (CI/CD)

Los workflows definidos en ``` .github/workflows/ ``` permiten automatizar la validación del proyecto en cada cambio relevante:

- **Build & Test (CI principal)**:

  - Instalación con ```npm ci```.

  - Ejecución de ```npm run lint```.

  - Ejecución de ```npm run test:coverage```.

  - Bloquea la integración de cambios que rompan el build o las pruebas.

- **Seguridad & Auditoría** (según configuración):

  -Preparado para integrarse con:

    - **CodeQL** (análisis estático de seguridad).

    - Escaneo de dependencias vulnerables (SCA).

    - Herramientas externas de análisis de calidad.

- **Release / Publicación**:

  - Configuración preparada para trabajar con:

    - Versionado semántico.

    - Publicación en GitHub Packages / NPM Registry (cuando se habilite).

Cada Push y Pull Request puede ser sometido a estas validaciones, entregando un pipeline trazable y alineado con prácticas profesionales.

## 🌿 12. Flujo de Trabajo con Git

Se recomienda el siguiente flujo, alineado con buenas prácticas:

**1.** Crear una rama desde ```master```:

  - ```feat/nueva-funcionalidad```

  - ```fix/correccion-bug```

**2.** Desarrollar cambios con **commits atómicos y descriptivos**.

**3.** Ejecutar localmente antes del push:
```
npm run lint
npm run test:coverage
```

**4.** Crear un **Pull Request** hacia ```master```:

  - Describir claramente el objetivo de los cambios.

  - Indicar impacto en módulos o componentes.

**5.** Permitir que los ```workflows de CI``` validen:

  - Solo integrar cambios con todos los checks en verde.

Este flujo asegura control, trazabilidad y calidad continua del código.

## 📚 13. Evidencias del Trabajo

El desarrollo de este repositorio está documentado en el **informe formal de la Evaluación Parcial N°2**, donde se detallan:

- Configuración del entorno y del repositorio.

- Ejecución de comandos y scripts clave.

- Configuración y resultado de los pipelines.

- Validación de pruebas y calidad.

- Alineación con los indicadores del **RA3**.

Este README funciona como versión técnica resumida y profesional de dichas evidencias para docentes, revisores y colaboradores.

## 👥 14. Autores

**Grupo G5 – AUY1102-001V-2025**

- Juan Ignacio Crovetto Navarro

- Bryan Painemilla

Proyecto desarrollado para **DUOC UC – Ciclo de Vida del Software I (AUY1102-001V-2025), Sección 001V.**

## 🤝 15. Cómo Contribuir

**1.** Crear una rama desde ```master``` siguiendo la convención: ```feat/*```, ```fix/*```, ```chore/*```.

**2.** Implementar los cambios respetando las reglas de estilo y estructura.

**3.** Ejecutar antes de confirmar:
```bash
npm run lint
npm run test:coverage
```

**4.** Crear un Pull Request con:

- Descripción clara.

- Motivo del cambio.

- Evidencias si corresponde.

**5.** Esperar la validación automática de la CI y revisión del equipo.

Cualquier contribución debe mantener el enfoque en **calidad, seguridad, mantenibilidad y coherencia con los objetivos académicos del proyecto.**


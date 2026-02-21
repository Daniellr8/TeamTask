# TeamTask – Dashboard de Gestión de Proyectos

Aplicación web para monitoreo de desempeño de desarrolladores, estado de proyectos y análisis de riesgo operativo.

El sistema está compuesto por:

- **API REST** desarrollada en ASP.NET Core
- **SPA** desarrollada en Angular
- **Base de datos SQL Server**
- Acceso a datos mediante **Dapper**

---

# 📌 1. Supuestos y Decisiones de Diseño

## Arquitectura

- Se implementó arquitectura en capas:
  - `API` → Controladores HTTP
  - `Core` → Interfaces y lógica de negocio (Handlers)
  - `Infrastructure` → Acceso a datos con Dapper
- Separación clara de responsabilidades (SRP).
- Inyección de dependencias usando el contenedor nativo de ASP.NET Core.

## Acceso a Datos

- Se eligió **Dapper** en lugar de Entity Framework para:
  - Mejor rendimiento.
  - Control explícito sobre consultas SQL.
  - Simplicidad en escenarios de reporting.

## Frontend

- Angular standalone components (sin NgModules).
- Uso de **PrimeNG** para componentes UI.
- Uso de `HttpClient` para consumo de API REST.
- Diseño responsive utilizando capacidades nativas de PrimeNG.

## API

- API RESTful siguiendo convención:
- Serialización en camelCase.
- CORS habilitado para entorno de desarrollo.

---

# ⚙️ 2. Instrucciones de Configuración

## Requisitos Previos

Instalar:

- .NET SDK 8.0
- Node.js 18+
- Angular CLI 21
- SQL Server 2019 o superior

---

## 🔹 Configuración de Base de Datos

1. Crear base de datos en SQL Server:

Ejecutar scrip de DBSetup_TeamTasks.sql

## 🔹 Configuración de API
1. editar archivo de appsettings.Development yu Colocar string de conexion a base datos creada
2. hacer dontnet restore para instalar paquetes nuget
3. ejecutar proyecto
4. probar en swagger los metodos y su informacion.

## 🔹 Configuración de frontEnd
1. adentro de la ruuta del UI hacer Npm Install
2. servir el aplicativo con el comnado "ng serve --open"
3. porbar visualizacion de datos.

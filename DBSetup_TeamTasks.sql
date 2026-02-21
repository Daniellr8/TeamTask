 CREATE DATABASE TeamTasksSample
 GO
 USE TeamTasksSample;
 GO

 CREATE TABLE  Developers
 (
 DeveloperId uniqueidentifier primary key default newid()
 ,FirstName nvarchar(100)
 ,LastName nvarchar(100)
 ,Email nvarchar(100)
 ,IsActive bit default 1
 ,Createat nvarchar(100)
 ,CONSTRAINT UQ_Developers_FirstNameLastNameEmail 
        UNIQUE (FirstName,LastName,Email)

 )

 CREATE TABLE Status
 (
 StatusId int primary key identity(1,1)
 ,Description nvarchar(30)
 ,IsActive bit default 1
 )

 CREATE TABLE Projects(
 ProjectId int primary key identity(1,1)
 ,Name nvarchar(100)
 ,ClienteName nvarchar(200) 
 ,StartDate datetime default getdate()
 ,EndDate datetime
 ,StatusId int

 CONSTRAINT FK_Projects_Status 
        FOREIGN KEY (StatusId) REFERENCES Status(StatusId)
 )

 CREATE TABLE Task(
 TaskId int primary key identity(1,1)
 ,ProjectId int 
 ,Title nvarchar(200)
 ,Description nvarchar(max)
 ,AssigneeId uniqueidentifier
 ,StatusId int
 ,Priority nvarchar(10)
 ,EstimatedComplexity int
 ,DueDate datetime
 ,CompletionDate datetime
 ,CreatedAt datetime,

 CONSTRAINT FK_Task_Project
    FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId),
    
 CONSTRAINT FK_Task_Developers
    FOREIGN KEY (AssigneeId) REFERENCES Developers(DeveloperId),
    
 CONSTRAINT FK_Task_Status
    FOREIGN KEY (StatusId) REFERENCES Status(StatusId)
 )

GO

INSERT INTO Developers (FirstName,LastName,Email,IsActive)
VALUES ('Mateo','Lopez','mateo.lopez@nserio.com',1),
('Daniel','Lopez','daniel.lopez@nserio.com',1),
('kevin','Renteria','kevin.renteria@nserio.com',1),
('Anderson','Borja','anderson.borja@nserio.com',1),
('Camila','Alzate','camila.alzate@nserio.com',1),
('Carlos','Pineda','carlos.pineda@nserio.com',0)

UPDATE Developers SET Createat = 'daniel.lopez@nserio.com'
GO
INSERT INTO Status (Description)
VALUES ('Planned'),
('InProgress'),
('ToDo'),
('Completed'),
('Blocked')
GO

INSERT INTO Projects (Name,ClienteName,StatusId,StartDate)
VALUES 
('Sistema de Ventas','Cliente A',1,'2025-06-30'),
('Plataforma de E-commerce','Cliente B',2,'2025-09-15'),
('Aplicación Móvil','Cliente C',3,'2025-12-01'),
('ERP Corporativo','Cliente D',4,'2025-08-20'),
('Chatbot IA','Cliente E',5,'2026-01-10');

UPDATE Projects SET EndDate = GETDATE() WHERE ProjectId = 2


INSERT INTO Task (ProjectId,Title,Description,AssigneeId,StatusId,Priority,EstimatedComplexity,DueDate,CompletionDate,CreatedAt)
VALUES
(1,'Diseño de Base de Datos','Crear modelo relacional inicial',
 (SELECT DeveloperId FROM Developers WHERE Email = 'mateo.lopez@nserio.com'),2,'High',5,'2025-06-30',null,GetDate()),

(1,'API de Autenticación','Desarrollar endpoints de login y registro',
 (SELECT DeveloperId FROM Developers WHERE Email = 'daniel.lopez@nserio.com'),2,'Medium',3,'2026-01-30',null,GetDate()),

(2,'Frontend React','Construir interfaz de usuario para catálogo',
 (SELECT DeveloperId FROM Developers WHERE Email = 'kevin.renteria@nserio.com'),3,'High',4,'2025-11-02',null,GetDate()),

(3,'Integración con GPS','Agregar geolocalización en la app móvil',
 (SELECT DeveloperId FROM Developers WHERE Email = 'anderson.borja@nserio.com'),1,'Low',2,'2025-12-30',null,GetDate()),
(4,'Módulo de Inventario','Desarrollar CRUD de productos',
 (SELECT DeveloperId FROM Developers WHERE Email = 'camila.alzate@nserio.com'),2,'High',5,'2025-08-05',null,GetDate()),

(5,'Entrenamiento del modelo IA','Configurar dataset y entrenar chatbot',
 (SELECT DeveloperId FROM Developers WHERE Email = 'carlos.pineda@nserio.com'),5,'High',6,'2025-07-23',null,GetDate());
 -- =========================================
-- DATOS DEMO ADICIONALES PARA TASK
-- =========================================
INSERT INTO Task (ProjectId, Title, Description, AssigneeId, StatusId, Priority, EstimatedComplexity, DueDate, CompletionDate, CreatedAt)
VALUES
-- =========================
-- Proyecto 1: Sistema de Ventas
-- =========================
(1,'Normalización de Tablas','Ajustar a 3FN y definir FKs',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),1,'High',5,'2025-07-05',NULL,GETDATE()),

(1,'Seeder de Datos','Crear seeds para catálogos base',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),3,'Medium',3,'2025-07-10',NULL,GETDATE()),

(1,'Endpoints de Productos','CRUD de productos v1',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),2,'High',4,'2025-07-12',NULL,GETDATE()),

(1,'Pruebas Unitarias','Cobertura mínima 70% en ventas',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),2,'Medium',3,'2025-07-20',NULL,GETDATE()),

(1,'Documentación Técnica','Actualizar diagramas y README',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),4,'Low',2,'2025-07-03','2025-07-02',GETDATE()),

-- =========================
-- Proyecto 2: Plataforma de E-commerce
-- =========================
(2,'Carrito Persistente','Mantener carrito por usuario autenticado',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),2,'High',5,'2025-11-10',NULL,GETDATE()),

(2,'Pasarela de Pagos','Integrar proveedor sandbox y validaciones',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),1,'High',6,'2025-11-15',NULL,GETDATE()),

(2,'Búsqueda Full-Text','Implementar búsqueda y ranking',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),3,'Medium',4,'2025-11-08',NULL,GETDATE()),

(2,'Optimización Front','Carga diferida e imágenes responsivas',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),4,'Low',2,'2025-11-05','2025-11-04',GETDATE()),

(2,'Observabilidad','Logs estructurados y métricas básicas',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),2,'Medium',3,'2025-11-12',NULL,GETDATE()),

-- =========================
-- Proyecto 3: Aplicación Móvil
-- =========================
(3,'Onboarding','Pantallas intro y permisos',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),3,'Medium',3,'2025-12-10',NULL,GETDATE()),

(3,'Modo Offline','Estrategia de cache y reintentos',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),1,'High',5,'2025-12-18',NULL,GETDATE()),

(3,'Notificaciones Push','Integrar FCM con tópicos',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),2,'Medium',4,'2025-12-14',NULL,GETDATE()),

(3,'Accesibilidad','Compatibilidad con screen readers',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),4,'Low',2,'2025-12-06','2025-12-05',GETDATE()),

(3,'Feature Flags','Rollout gradual por segmentos',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),1,'Medium',3,'2025-12-11',NULL,GETDATE()),

-- =========================
-- Proyecto 4: ERP Corporativo
-- =========================
(4,'Módulo de Compras','Flujo de órdenes y aprobaciones',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),2,'High',6,'2025-08-28',NULL,GETDATE()),

(4,'Integración Contable','Exportar asientos a formato estándar',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),3,'High',5,'2025-09-02',NULL,GETDATE()),

(4,'Auditoría de Cambios','Trazabilidad por entidad y usuario',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),1,'Medium',4,'2025-08-26',NULL,GETDATE()),

(4,'Reportes de KPI','Dashboard de inventario y rotación',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),2,'Medium',4,'2025-08-30',NULL,GETDATE()),

(4,'Hardening de Seguridad','CSP, rate limit y CSRF',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),5,'High',5,'2025-08-27',NULL,GETDATE()),

-- =========================
-- Proyecto 5: Chatbot IA
-- =========================
(5,'Limpieza de Dataset','Eliminar duplicados y balancear clases',
 (SELECT DeveloperId FROM Developers WHERE Email='carlos.pineda@nserio.com'),2,'High',5,'2025-07-28',NULL,GETDATE()),

(5,'Evaluación del Modelo','Definir métricas y baseline',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),1,'Medium',4,'2025-07-29',NULL,GETDATE()),

(5,'Fine-Tuning','Iteraciones con feedback interno',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),3,'High',6,'2025-08-01',NULL,GETDATE()),

(5,'Despliegue en QA','Healthchecks y rollback plan',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),2,'Medium',4,'2025-07-30',NULL,GETDATE()),

(5,'Guardrails de Contenido','Filtros de seguridad y políticas',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),1,'High',5,'2025-07-31',NULL,GETDATE()),

-- =========================
-- Extras: mezcla de estados con completadas
-- =========================
(1,'Refactor Auth','Mejorar manejo de tokens y refresh',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),4,'Medium',3,'2025-07-07','2025-07-06',GETDATE()),

(2,'Mejora SEO','Etiquetas meta y datos estructurados',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),4,'Low',2,'2025-11-06','2025-11-05',GETDATE()),

(3,'Fix Crash Android 13','Ajuste permisos en background',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),5,'Medium',3,'2025-12-03',NULL,GETDATE()),

(4,'Script ETL Diario','Cargar ventas a data warehouse',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),2,'High',5,'2025-09-01',NULL,GETDATE()),

(5,'Monitoreo de Sesgos','Revisión por segmento de usuario',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),3,'Medium',4,'2025-08-03',NULL,GETDATE());
GO

 -- ============================================================
-- DATOS DEMO ADICIONALES: DueDate en próximos 7 días y otros
-- ============================================================
-- Nota: usamos CAST(GETDATE() AS DATE) para truncar la hora
-- y DATEADD(DAY, n, ...) para movernos en días relativos.

INSERT INTO Task (ProjectId, Title, Description, AssigneeId, StatusId, Priority, EstimatedComplexity, DueDate, CompletionDate, CreatedAt)
VALUES
-- =========================
-- DueDate HOY (día 0) - NO Completed
-- =========================
(1,'Revisión de Esquemas','Ajustar índices y llaves para rendimiento',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),2,'High',4,
 CAST(GETDATE() AS DATE), NULL, GETDATE()),

(2,'Validación de Reglas de Negocio','Definir validaciones en backend',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),3,'Medium',3,
 CAST(GETDATE() AS DATE), NULL, GETDATE()),

-- =========================
-- DueDate en 2 días - NO Completed
-- =========================
(3,'UI de Perfil','Diseñar pantalla de perfil y edición básica',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),1,'Low',2,
 DATEADD(DAY, 2, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

(4,'Workflow de Aprobación','Definir estados y transiciones',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),5,'High',5,
 DATEADD(DAY, 2, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

-- =========================
-- DueDate en 4 días - NO Completed
-- =========================
(5,'Entrenamiento incremental','Reentrenar modelo con nuevos intents',
 (SELECT DeveloperId FROM Developers WHERE Email='carlos.pineda@nserio.com'),2,'Medium',4,
 DATEADD(DAY, 4, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

(1,'Políticas de Retención','Configurar TTL en logs y auditorías',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),3,'Medium',3,
 DATEADD(DAY, 4, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

-- =========================
-- DueDate en 6 días - NO Completed
-- =========================
(2,'Cache en BFF','Agregar capa de cache para catálogos',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),1,'High',5,
 DATEADD(DAY, 6, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

(3,'Gestión de Errores','Estrategia global de manejo de errores',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),2,'Medium',3,
 DATEADD(DAY, 6, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

-- =========================
-- DueDate en 1 y 5 días - Completed (para validar que NO aparezcan)
-- =========================
(4,'Reporte Diario','Generar reporte PDF y envío automático',
 (SELECT DeveloperId FROM Developers WHERE Email='kevin.renteria@nserio.com'),4,'Low',2,
 DATEADD(DAY, 1, CAST(GETDATE() AS DATE)), DATEADD(DAY, 0, CAST(GETDATE() AS DATE)), GETDATE()),

(5,'Checklist de Seguridad','Revisar OWASP Top 10 y hardening',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),4,'Medium',3,
 DATEADD(DAY, 5, CAST(GETDATE() AS DATE)), DATEADD(DAY, 3, CAST(GETDATE() AS DATE)), GETDATE()),

-- =========================
-- VENCIDAS (ayer y -3 días) - NO Completed (para pruebas de atrasadas)
-- =========================
(1,'Refactor de Repositorios','Unificar repositorios y patrones',
 (SELECT DeveloperId FROM Developers WHERE Email='daniel.lopez@nserio.com'),2,'High',5,
 DATEADD(DAY, -1, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

(2,'Monitoreo de Errores','Configurar alertas y dashboards',
 (SELECT DeveloperId FROM Developers WHERE Email='camila.alzate@nserio.com'),5,'Medium',3,
 DATEADD(DAY, -3, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

-- =========================
-- FUTURAS (> 7 días) - NO Completed (para pruebas de filtro)
-- =========================
(3,'Optimización de Build','Reducir tiempos de CI/CD',
 (SELECT DeveloperId FROM Developers WHERE Email='mateo.lopez@nserio.com'),1,'Medium',3,
 DATEADD(DAY, 12, CAST(GETDATE() AS DATE)), NULL, GETDATE()),

(4,'Batch Nocturno','Ajustar ventana de procesamiento',
 (SELECT DeveloperId FROM Developers WHERE Email='anderson.borja@nserio.com'),2,'High',5,
 DATEADD(DAY, 15, CAST(GETDATE() AS DATE)), NULL, GETDATE());
GO

/*TEST*/

SELECT * FROM Developers
SELECT * FROM Status
SELECT * FROM Projects
SELECT * FROM Task






/* 2.2 Consultas requeridas (DML) */
/* 2.2.1 Resumen de carga por desarrollador (solo desarrolladores activos) */

select 
CONCAT(d.FirstName,' ',d.LastName) AS DeveloperName,
COUNT(T.TaskId) as OpentaskCount,
AVG(CAST(T.EstimatedComplexity AS DECIMAL(10,2))) AS AvgEstimatedComplexity
from Developers D
INNER JOIN Task T ON D.DeveloperId  = T.AssigneeId
INNER JOIN Status ST ON  T.StatusId = ST.StatusId
WHERE  D.IsActive = 1 AND ST.Description <> 'Completed'
GROUP BY 
    D.FirstName,
    D.LastName
ORDER BY OpentaskCount

/*2.2.2 Resumen de estado por proyecto:*/

select 
 P.Name AS ProjectName,
    SUM(CASE WHEN ST.Description <> 'Completed' THEN 1 ELSE 0 END) AS OpenTasks,
    SUM(CASE WHEN ST.Description = 'Completed' THEN 1 ELSE 0 END) AS CompletedTask


from Projects P 
INNER JOIN Task T ON P.ProjectId = T.ProjectId
INNER JOIN Status ST ON T.StatusId = ST.StatusId

GROUP BY
    P.ProjectId,
    P.Name

ORDER BY
    P.ProjectId;

/*2.2.3 Tareas próximas a vencer*/

SELECT T.* FROM Task T
INNER JOIN Status ST ON T.StatusId = ST.StatusId
WHERE DueDate > DATEADD(DAY,-7,GETDATE()) AND ST.Description <> 'COMPLETED'


/*2.3 Developer Delay Risk Prediction (SQL avanzado)*/

SELECT
    D.DeveloperId,
    CONCAT(D.FirstName, ' ', D.LastName) AS DeveloperName,

    SUM(CASE WHEN ST.Description <> 'Completed' THEN 1 ELSE 0 END) AS OpenTasksCount,

    AVG(
        CASE 
            WHEN ST.Description = 'Completed' THEN
                CASE 
                    WHEN DATEDIFF(DAY, T.DueDate, T.CompletionDate) > 0 
                    THEN DATEDIFF(DAY, T.DueDate, T.CompletionDate)
                    ELSE 0
                END
        END
    ) AS AvgDelayDays,
    MIN(
        CASE WHEN ST.Description <> 'Completed' THEN T.DueDate END
    ) AS NearestDueDate,

    
    MAX(
        CASE WHEN ST.Description <> 'Completed' THEN T.DueDate END
    ) AS LatestDueDate,
   
    DATEADD(
        DAY,
        ISNULL(
            AVG(
                CASE 
                    WHEN ST.Description = 'Completed' THEN
                        CASE WHEN DATEDIFF(DAY, T.DueDate, T.CompletionDate) > 0 
                             THEN DATEDIFF(DAY, T.DueDate, T.CompletionDate)
                             ELSE 0
                        END
                END
            ), 0
        ),
        MAX(CASE WHEN ST.Description <> 'Completed' THEN T.DueDate END)
    ) AS PredictedCompletionDate,

    
    CASE 
        WHEN 
            (
                DATEADD(
                    DAY,
                    ISNULL(
                        AVG(
                            CASE 
                                WHEN ST.Description = 'Completed' THEN
                                    CASE WHEN DATEDIFF(DAY, T.DueDate, T.CompletionDate) > 0 
                                         THEN DATEDIFF(DAY, T.DueDate, T.CompletionDate)
                                         ELSE 0
                                    END
                            END
                        ), 0
                    ),
                    MAX(CASE WHEN ST.Description <> 'Completed' THEN T.DueDate END)
                )
            ) > MAX(CASE WHEN ST.Description <> 'Completed' THEN T.DueDate END)
          OR 
            ISNULL(
                AVG(
                    CASE 
                        WHEN ST.Description = 'Completed' THEN
                            CASE WHEN DATEDIFF(DAY, T.DueDate, T.CompletionDate) > 0 
                                 THEN DATEDIFF(DAY, T.DueDate, T.CompletionDate)
                                 ELSE 0
                            END
                    END
                ), 0
            ) >= 3
        THEN 1 
        ELSE 0
    END AS HighRiskFlag

FROM Developers D
LEFT JOIN Task T 
    ON D.DeveloperId = T.AssigneeId
LEFT JOIN Status ST 
    ON T.StatusId = ST.StatusId
WHERE D.IsActive = 1
GROUP BY 
    D.DeveloperId,
    D.FirstName,
    D.LastName
ORDER BY DeveloperName;
GO
/*2.2.4 Insertar nueva tarea:*/
CREATE PROCEDURE TT_Insert_Task   
(  
@ProjectId int  
,@Title Nvarchar(200)  
,@Description Nvarchar(max)  
,@AssigneeId uniqueidentifier  
,@StatusId int  
,@Priority nvarchar(10)  
,@EstimatedComplexity int  
,@DueDate DateTime   
,@CreatedAt DateTime   
,@TaskId int output  
)  
AS  
BEGIN  
    IF NOT EXISTS (SELECT 1 FROM Developers WHERE DeveloperId = @AssigneeId and IsActive = 1)  
        BEGIN  
            RAISERROR('Desarrolador no existe en base datos',16,1);  
        END  
  
    IF NOT EXISTS (SELECT 1 FROM Projects where ProjectId = @ProjectId)  
        BEGIN  
            RAISERROR('El projecto no existe en base datos',16,1);  
        END  
  
      
    BEGIN TRY  
  
      
        IF @CreatedAt IS NULL  
            SET @CreatedAt =  GETDATE()  
  
        IF @ProjectId IS NULL OR @ProjectId <= 0  
            THROW 50001, 'El ProjectId es obligatorio y debe ser mayor que cero.', 1;  
  
        IF @Title IS NULL OR LTRIM(RTRIM(@Title)) = ''  
            THROW 50002, 'El Title es obligatorio.', 1;  
  
        IF @AssigneeId IS NULL  
            THROW 50003, 'El AssigneeId es obligatorio.', 1;  
  
        IF @StatusId IS NULL OR @StatusId <= 0  
            THROW 50004, 'El StatusId es obligatorio y debe ser mayor que cero.', 1;  
  
        IF @Priority IS NULL OR LTRIM(RTRIM(@Priority)) = ''  
            THROW 50005, 'La Priority es obligatoria.', 1;  
  
        IF @EstimatedComplexity IS NULL OR @EstimatedComplexity < 0  
            THROW 50006, 'EstimatedComplexity es obligatoria y no puede ser negativa.', 1;  
  
        IF @DueDate IS NULL  
            THROW 50007, 'DueDate es obligatoria.', 1;  
  
        IF @DueDate < DATEADD(DAY, -1, CAST(SYSDATETIME() AS DATE))  
            THROW 50008, 'DueDate no puede ser  en el pasado.', 1;  
  
        -- Validación de dominio de prioridad (si no tienes catálogo)  
        IF UPPER(@Priority) NOT IN ('LOW','MEDIUM','HIGH')  
            THROW 50009, 'Priority inválida. Valores permitidos: Low, Medium, High.', 1;  
     
  
    INSERT INTO Task   
    (  
        ProjectId,  
        Title,  
        Description,  
        AssigneeId,  
        StatusId,  
        Priority,  
        EstimatedComplexity,  
        DueDate,  
        CreatedAt  
    )  
    VALUES   
    (  
            @ProjectId  
        ,@Title   
        ,@Description   
        ,@AssigneeId   
        ,@StatusId  
        ,@Priority  
        ,@EstimatedComplexity  
        ,@DueDate  
        ,@CreatedAt    
    )  
     SET @TaskId = SCOPE_IDENTITY();  
  
    END TRY  
    BEGIN CATCH  
         THROW;  
    END CATCH  
END  

DECLARE @NewTaskId INT;

EXEC dbo.TT_Insert_Task 1 ,'Configurar alertas','Crear alertas por umbrales de error','F89E62E0-F897-475C-A4D0-FD12FB0D53B6',2,'High',4,'2026-03-28','2026-02-24',@NewTaskId OUTPUT;

SELECT @NewTaskId AS TaskIdCreado;


GO
CREATE PROCEDURE TT_Update_Task_Status (
@TaskId int,
@StatusId int 
)
AS
BEGIN

 IF NOT EXISTS (SELECT 1 FROM Task WHERE TaskId = @TaskId )  
        BEGIN  
            RAISERROR('Esta Tarea no existe en base de datos',16,1);  
        END  

    UPDATE Task SET StatusId = @StatusId WHERE TaskId = @TaskId

END
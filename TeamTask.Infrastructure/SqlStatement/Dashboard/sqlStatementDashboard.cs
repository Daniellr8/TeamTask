using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Infrastructure.SqlStatement.Dashboard
{
    public class sqlStatementDashboard
    {
        public static string QueryGetDeveloperWorkload => """           
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
                """;

        public static string QueryGetProjectHealth => """
            select 
            
                P.Name AS ProjectName,
                SUM(CASE WHEN ST.Description <> 'Completed' THEN 1 ELSE 0 END) AS OpenTasks,
                SUM(CASE WHEN ST.Description = 'Completed' THEN 1 ELSE 0 END) AS CompletedTasks


            from Projects P 
            INNER JOIN Task T ON P.ProjectId = T.ProjectId
            INNER JOIN Status ST ON T.StatusId = ST.StatusId

            GROUP BY
                P.ProjectId,
                P.Name

            ORDER BY
                P.ProjectId;
            """;
        public static string QueryGetDelayRiskPrediction => """
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
            """;
    }
}

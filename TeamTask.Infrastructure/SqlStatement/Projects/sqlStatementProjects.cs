using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Infrastructure.SqlStatement.Projects
{
    public class sqlStatementProjects
    {
        public static string QueryGetResumeProjects => """           
             SELECT 
            p.ProjectId,
            p.Name,
            P.ClienteName,
            STP.Description,
            COUNT(T.TaskId) AS TotalTasks,
            P.Name AS ProjectName,
            SUM(CASE WHEN ST.Description <> 'Completed' THEN 1 ELSE 0 END) AS OpenTasks,
            SUM(CASE WHEN ST.Description = 'Completed' THEN 1 ELSE 0 END) AS CompletedTask

            FROM Projects P 
            INNER JOIN Task T ON P.ProjectId = T.ProjectId
            INNER JOIN Status ST ON T.StatusId = ST.StatusId
            INNER JOIN Status STP ON P.StatusId = STP.StatusId

            GROUP BY
                P.ProjectId,
                P.Name,
                P.ClienteName,
                STP.Description

            ORDER BY
                P.ProjectId;

            """;

        public static string QueryGetProjectTasks => """
            SELECT
            p.ProjectId,
            p.Name,
            P.ClienteName,
            STP.Description,
            T.TaskId,
            T.Title,
            T.Description AS TaskDescription,
            T.AssigneeId,
            T.StatusId,
            T.Priority,
            T.EstimatedComplexity,
            T.DueDate,
            T.CompletionDate,
            T.CreatedAt
            FROM Projects P
            INNER JOIN Task T ON P.ProjectId = T.ProjectId
            INNER JOIN Status ST ON T.StatusId = ST.StatusId
            INNER JOIN Status STP ON P.StatusId = STP.StatusId
                WHERE P.ProjectId = @ProjectId
                ORDER BY T.TaskId

            """;
    }
}

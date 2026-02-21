using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Infrastructure.SqlStatement.Task
{
    public class sqlStatementTask
    {
        public static string QueryGetAllTask => """
            SELECT [TaskId]
                ,[ProjectId]
                ,[Title]
                ,[Description]
                ,[AssigneeId]
                ,[StatusId]
                ,[Priority]
                ,[EstimatedComplexity]
                ,[DueDate]
                ,[CompletionDate]
                ,[CreatedAt]
            FROM Task
            """;
    }
}

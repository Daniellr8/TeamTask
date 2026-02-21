using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Interfaces;
using TeamTask.Core.Models.TaskDto;
using TeamTask.Core.Models.TaskDto.Requests;
using TeamTask.Infrastructure.Interfaces.DataAccess;
using TeamTask.Infrastructure.SqlStatement.Task;

namespace TeamTask.Core.Handlers
{
    public class TaskHandler(IDapperDataAccess dataAccess) : ITaskHandler
    {
        public async Task<List<TaskDto>> GetAllTasks()
        {
            return await Task.FromResult(dataAccess.GetAll<TaskDto>(sqlStatementTask.QueryGetAllTask).ToList());
        }
        public async Task<int> CreateTask(TaskRequestDto taskDto)
        {
            var parameters = new DynamicParameters(taskDto);

            parameters.Add("@TaskId", dbType: DbType.Int32, direction: ParameterDirection.Output);

            await dataAccess.ExecuteAsync("TT_Insert_Task", parameters);

            return parameters.Get<int>("@TaskId");
        }
        public async Task UpdateTaskStatus(int taskId, UpdateStatusTaskRequestDto statusId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@TaskId", taskId);
            parameters.Add("@StatusId", statusId.StatusId);
            await dataAccess.ExecuteAsync("TT_Update_Task_Status", parameters);
        }
    }
}

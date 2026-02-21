using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Models.TaskDto;
using TeamTask.Core.Models.TaskDto.Requests;

namespace TeamTask.Core.Interfaces
{
    public interface ITaskHandler
    {
        Task<List<TaskDto>> GetAllTasks();
        Task<int> CreateTask(TaskRequestDto taskDto);
        Task UpdateTaskStatus(int taskId, UpdateStatusTaskRequestDto statusId);
    }
}

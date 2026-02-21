using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using TeamTask.Core.Interfaces;
using TeamTask.Core.Models.TaskDto.Requests;

namespace TeamTask.API.Controllers
{
    public class TaskController(ITaskHandler taskHandler) : ControllerBase
    {

        [HttpGet("[action]")]
        public async Task<IActionResult> GetAllTasks()
        {
            return Ok(await taskHandler.GetAllTasks());
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> CreateTask([FromBody] TaskRequestDto taskDto)
        {
            //return Ok(await taskHandler.CreateTask(taskDto));

            try
            {
                var id = await taskHandler.CreateTask(taskDto);
                return Ok(new { TaskId = id });
            }
            catch (SqlException ex)
            {
                return BadRequest(new
                {
                    error = ex.Message,
                    number = ex.Number
                });
            }
        }
        [HttpPut("tasks/{id}/status")]
        public async Task<IActionResult> UpdateTaskStatus(int id, [FromBody] UpdateStatusTaskRequestDto statusId)
        {
            try
            {
                await taskHandler.UpdateTaskStatus(id, statusId);
                return NoContent();
            }
            catch (SqlException ex)
            {
                return BadRequest(new
                {
                    error = ex.Message,
                    number = ex.Number
                });
            }
        }
    }
}

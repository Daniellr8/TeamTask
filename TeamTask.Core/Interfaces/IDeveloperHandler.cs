using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Models.Developer;

namespace TeamTask.Core.Interfaces
{
    public interface IDeveloperHandler
    {
        Task<List<DeveloperDto>> GetAllDevelopers();
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Interfaces;
using TeamTask.Core.Models.Developer;
using TeamTask.Infrastructure.Interfaces.DataAccess;
using TeamTask.Infrastructure.SqlStatement.Developers;

namespace TeamTask.Core.Handlers
{
    public class DeveloperHandler(IDapperDataAccess dapperDataAccess): IDeveloperHandler
    {
        public async Task<List<DeveloperDto>> GetAllDevelopers()
        {
            return await Task.FromResult(dapperDataAccess.GetAll<DeveloperDto>(sqlStatementDevelopers.GetAllDevelopers()).ToList());
        }
    }
}

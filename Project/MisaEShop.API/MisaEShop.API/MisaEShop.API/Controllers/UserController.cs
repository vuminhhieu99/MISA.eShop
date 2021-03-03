using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Misa.Bussiness.Interface;
using Misa.Common.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MISAeShop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : BaseController<User>
    {
        private IUserBussiness _userBussiness;
        public UserController(IUserBussiness userBussiness, IBaseBussiness<User> baseBussiness) : base(baseBussiness)
        {
            _userBussiness = userBussiness;

        }
        [HttpPost]
        public override async Task<IActionResult> Post([FromBody] User user)
        {
            var result = await _userBussiness.Insert(user);
            return Ok(result);
        }
    }

    
}

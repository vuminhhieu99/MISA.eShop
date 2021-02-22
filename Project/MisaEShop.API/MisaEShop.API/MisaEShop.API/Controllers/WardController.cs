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
    public class WardController : BaseController<Ward>
    {
        private IWardBussiness _wardBussiness;
        public WardController(IWardBussiness wardBussiness, IBaseBussiness<Ward> baseBussiness) : base(baseBussiness)
        {
            _wardBussiness = wardBussiness;
        }
        [HttpGet("")]
        public async Task<IActionResult> Get(int? districtId)
        {
            return Ok(await _wardBussiness.GetData(districtId));
        }
        // GET: api/Shop
        [HttpGet("neighbors")]
        public async Task<IActionResult> Get(int warId)
        {
            return Ok(await _wardBussiness.Neighbors(warId));
        }
    }
}

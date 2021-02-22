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
    public class DistrictController : BaseController<District>
    {
        private IDistrictBussiness _districtBussiness;
        public DistrictController(IDistrictBussiness districtBussiness, IBaseBussiness<District> baseBussiness) : base(baseBussiness)
        {
            _districtBussiness = districtBussiness;
        }
        [HttpGet("")]
        public async Task<IActionResult> Get(int? cityId)
        {
            return Ok(await _districtBussiness.GetData(cityId));
        }
    }
}

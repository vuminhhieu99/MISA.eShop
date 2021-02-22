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
    public class CityController : BaseController<City>
    {
        private ICityBussiness _cityBussiness;
        public CityController(ICityBussiness cityBussiness, IBaseBussiness<City> baseBussiness) : base(baseBussiness)
        {
            _cityBussiness = cityBussiness;
        }
        [HttpGet("")]
        public async Task<IActionResult> Get(int? countryId)
        {
            return Ok(await _cityBussiness.GetData(countryId));
        }
    }
}

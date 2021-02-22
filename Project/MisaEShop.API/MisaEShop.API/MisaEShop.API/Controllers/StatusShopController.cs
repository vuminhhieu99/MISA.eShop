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
    public class StatusShopController : BaseController<StatusShop>
    {
        
        public StatusShopController(IBaseBussiness<StatusShop> baseBussiness) : base(baseBussiness)
        {
            ;

        }
    }
}

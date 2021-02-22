using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Misa.Bussiness.Interface;
using Misa.Common.Requests.Shop;
using Misa.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MISAeShop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShopController : BaseController<Shop>
    {
        private IShopBussiness _shopBussiness;
        public ShopController(IShopBussiness shopBussiness, IBaseBussiness<Shop> baseBussiness) : base(baseBussiness)
        {
            _shopBussiness = shopBussiness;

        }


        // GET: api/Shop/All
        [HttpGet("All")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _shopBussiness.GetFullData());
        }

        // GET: api/Shop
        [HttpGet]
        public async Task<IActionResult> Get(int pageIndex, int pageSize, string shopCode = "", string shopName = "", string address = "", string phone = "", int? statusId = null)
        {
        
            PageRequest pageRequest = new PageRequest()
            {
               
                PageIndex = pageIndex,
                PageSize = pageSize,
                ShopCode = shopCode,
                ShopName = shopName,
                Address = address,
                Phone = phone,
                StatusId = (statusId == null || statusId == 0)? "" : statusId.ToString()
            };
            return Ok(await _shopBussiness.GetData(pageRequest));
        }


        // POST api/Shop
        [HttpPost]
        public override async Task<IActionResult> Post([FromBody] Shop shop)
        {
            var result = await _shopBussiness.Insert(shop);
            return Ok(result);
        }
        // PUT api/Shop
        [HttpPut]
        public override async Task<IActionResult> Put([FromBody] Shop shop)
        {
            var result = await _shopBussiness.Update(shop);
            return Ok(result);
        }

        // Delete api/Shop
        [HttpDelete("{id}")]
        public override async Task<IActionResult> Delete(string id)
        {
            var result = await _shopBussiness.Delete(id);
            return Ok(result);
        }
    }
}

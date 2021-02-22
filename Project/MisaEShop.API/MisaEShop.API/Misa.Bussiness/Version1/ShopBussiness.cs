using Misa.Bussiness.Interface;
using Misa.Common;
using Misa.Common.Enum;
using Misa.Common.Requests.Shop;
using Misa.Common.Results;
using Misa.Common.Results.Models;
using Misa.Data.Entities;
using Misa.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Version1
{
    //BaseBussiness<Shop>: chỉ định lớp cha nếu như không dùng kỹ thuật DI
    public class ShopBussiness : BaseBussiness<Shop>, IShopBussiness
    {
        private IShopData _shopData;
        private IBaseBussiness<Shop> _baseBussiness;


        public ShopBussiness(IShopData shopData, IBaseBussiness<Shop> baseBussiness, IBaseData<Shop> baseData) : base(baseData)
        {
            _shopData = shopData;
            _baseBussiness = baseBussiness;
        }

        /// <summary>
        /// lấy ra toàn bộ danh sách cửa hàng
        /// </summary>
        /// <returns>ServiceResult</returns>
        /// update: 3/2/2021
        //public ServiceResult GetData()
        //{

        ////string command = "SELECT * FROM Shop WHERE ShopCode LIKE CONCAT('%',@ShopCode,'%') AND Phone LIKE CONCAT('%',@Phone,'%')";


        //    var listShop = _shopData.GetData();
        //    return new ServiceResult()
        //    {
        //        Data = listShop,
        //        Error = null,
        //        MISAeShopCode = MISAeShopServiceCode.Success
        //    };
        //}   

        /// <summary>
        /// Lấy ra danh sách cửa hàng
        /// </summary>
        /// <param name="pageRequest">keyword, id phòng ban, id chức vụ, trang số, số bản ghi</param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public async Task<ServiceResult> GetData(PageRequest pageRequest)
        {
            var list = await _shopData.GetData(pageRequest);
            var listPage = list.Skip(pageRequest.PageSize * (pageRequest.PageIndex - 1))
  .Take(pageRequest.PageSize);
            var ListPacket = new PageResult<ShopResult>()
            {
                Items = listPage,
                TotalRecord = list.Count()
            };
            return new ServiceResult()
            {
                Data = ListPacket,
                Error = null,
                MISAeShopCode = MISAeShopServiceCode.Success
            };
        }

        /// <summary>
        /// Lấy ra toàn bộ danh sách cửa hàng đầy đủ
        /// </summary>
        /// <param name="pageRequest"></param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public async Task<ServiceResult> GetFullData()
        {
            var listShop = await _shopData.GetData();

            return new ServiceResult()
            {
                Data = listShop,
                Error = null,
                MISAeShopCode = MISAeShopServiceCode.Success
            };
        }

        /// <summary>
        /// thêm mới cửa hàng
        /// </summary>
        /// <param name="shop">thông tin cửa hàng</param>
        /// <returns>ServiceResult</returns>
        /// update: 3/2/2021
        public override async Task<ServiceResult> Insert(Shop shop)
        {

            ServiceResult serviceResult = new ServiceResult();
            if(shop.WardId == 0)
            {
                shop.WardId = 1;
            }
            //validate Data
            _baseBussiness.ValidateObject(ref serviceResult,ref shop);            

            if (serviceResult.MISAeShopCode == MISAeShopServiceCode.BadRequest)
            {
                return serviceResult;
            }
            return await _baseBussiness.Insert(shop);
        }

        /// <summary>
        /// cập nhập cửa hàng
        /// </summary>
        /// <param name="shop">thông tin cửa hàng</param>
        /// <returns>ServiceResult</returns>

        public override async Task<ServiceResult> Update(Shop shop)
        {
            ServiceResult serviceResult = new ServiceResult();
            if (shop.WardId == 0)
            {
                shop.WardId = null;
            }
            _baseBussiness.ValidateObject(ref serviceResult,ref shop);
            //var oldShop = (await _baseBussiness.GetById(shop.ShopId.ToString())).Data as Shop;
            
            if (serviceResult.MISAeShopCode == MISAeShopServiceCode.BadRequest)
            {
                return serviceResult;
            }

            return await _baseBussiness.Update(shop);
        }

        /// <summary>
        /// Xóa cửa hàng theo id
        /// </summary>
        /// <param name="id">id của cửa hàng</param>
        /// <returns>ServiceResult</returns>
        public override async Task<ServiceResult> Delete(string id)
        {
            // valiable dữ liệu
            //todo...
           return await _baseBussiness.Delete(id);
            
        }
    }
}

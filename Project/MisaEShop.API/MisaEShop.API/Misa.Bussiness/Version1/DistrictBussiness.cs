using Misa.Bussiness.Interface;
using Misa.Common;
using Misa.Common.Entities;
using Misa.Common.Enum;
using Misa.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Version1
{
    public class DistrictBussiness : BaseBussiness<District>, IDistrictBussiness
    {
        private IBaseData<District> _baseData;

        public DistrictBussiness(IBaseData<District> baseData) : base(baseData)
        {

            _baseData = baseData;
        }
        /// <summary>
        /// Lấy ra danh sách quận/huyện theo thành phố
        /// </summary>
        /// <param name="countryId">id tỉnh/ thành phố</param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public async Task<ServiceResult> GetData(int? cityId)
        {
            string query;
            if (cityId == null || cityId == 0)
            {
                query = $"SELECT * FROM District";
            }
            query = $"SELECT * FROM District where cityId = {cityId}";
            var list = await _baseData.GetData<District>(query);
            return new ServiceResult()
            {
                Data = list,
                Error = null,
                MISAeShopCode = MISAeShopServiceCode.Success
            };
        }
    }
}


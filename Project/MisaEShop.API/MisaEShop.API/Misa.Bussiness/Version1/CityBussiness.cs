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
    public class CityBussiness : BaseBussiness<City>, ICityBussiness
    {               
        private IBaseData<City> _baseData;

        public CityBussiness(IBaseData<City> baseData) : base(baseData)
        {           
            _baseData = baseData;
        }

        /// <summary>
        /// Lấy ra danh sách thành phố theo quốc gia
        /// </summary>
        /// <param name="countryId">id quốc gia</param>
        /// <returns>ServiceResult</returns>
        /// create :22/2/2021
        public async Task<ServiceResult> GetData(int? countryId)
        {
            string query;            
            if (countryId == null || countryId == 0)
            {
                query = $"SELECT * FROM City";
            }
            query = $"SELECT * FROM City where countryId = {countryId}";
            var list = await _baseData.GetData<City>(query);
            return new ServiceResult()
            {
                Data = list,
                Error = null,
                MISAeShopCode = MISAeShopServiceCode.Success
            };
        }
    }
}

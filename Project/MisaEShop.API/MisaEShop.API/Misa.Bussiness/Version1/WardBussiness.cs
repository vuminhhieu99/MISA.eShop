using Misa.Bussiness.Interface;
using Misa.Common;
using Misa.Common.Entities;
using Misa.Common.Enum;
using Misa.Common.Results;
using Misa.Common.Results.Models;
using Misa.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Version1
{
    public class WardBussiness : BaseBussiness<Ward>, IWardBussiness
    {
        private IBaseData<Ward> _baseData;

        public WardBussiness(IBaseData<Ward> baseData) : base(baseData)
        {

            _baseData = baseData;
        }

        /// <summary>
        /// Lấy ra danh sách xã/phường theo quận/huyện
        /// </summary>
        /// <param name="countryId">id quận/ huyện</param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public async Task<ServiceResult> GetData(int? districtId)
        {
            string query;
            if (districtId == null || districtId == 0)
            {
                query = $"SELECT * FROM Ward";
            }
            query = $"SELECT * FROM Ward where districtId = {districtId}";
            var list = await _baseData.GetData<Ward>(query);
            return new ServiceResult()
            {
                Data = list,
                Error = null,
                MISAeShopCode = MISAeShopServiceCode.Success
            };
        }

        /// <summary>
        /// Lấy ra danh sách xã/phường cùng quận/huyện ,danh sách quận/huyện cùng tỉnh/thành phố, danh sách tỉnh/ thành phố cùng quốc gia- kỹ thuật DI
        /// </summary>
        /// <param name="countryId">id xã/phường</param>
        /// <returns>ServiceResult</returns>
        /// create :22/2/2021
        public async Task<ServiceResult> Neighbors(int wardId)
        {
            if (wardId <= 0)
            {
                var error = new List<ErrorResult>();
                error.Add(new ErrorResult()
                {
                    DevMsg = Properties.Resources.ErrorServive_WardId,
                    UserMsg = Properties.Resources.ErrorServive_WardId

                });
                return new ServiceResult()
                {
                    Data = "",
                    Error = error,
                    MISAeShopCode = MISAeShopServiceCode.BadRequest
                };
            }
            
            Ward ward = await _baseData.GetById(wardId);
            var neighbors = new NeigborsResult();
            //lấy ra quận/huyện phố được chọn
            neighbors.SelectDistrict = ward.DistrictId;
            //lấy ra danh sách xã/ phường hàng xóm
            var queryWard = $"SELECT * FROM Ward where districtId = {neighbors.SelectDistrict}";
            neighbors.ListWard = (await _baseData.GetData(queryWard)).ToList();
            //lấy ra tỉnh/ thành phố được chọn
            neighbors.SelectCity = ((await _baseData.GetById<District>(neighbors.SelectDistrict)) as District).CityId;
            //lấy ra danh sách quận/huyện hàng xóm
            var queryDistrict = $"SELECT * FROM District where cityId = {neighbors.SelectCity}";
            neighbors.ListDistrict = (await _baseData.GetData<District>(queryDistrict)).ToList();
            //lấy ra quốc gia được chọn
            neighbors.SelectCountry = ((await _baseData.GetById<City>(neighbors.SelectCity)) as City).CountryId;
            //lấy ra danh sách tỉnh/ thành phố hàng xóm
            var queryCity = $"SELECT * FROM City where countryId = {neighbors.SelectCountry}";
            neighbors.ListCity = (await _baseData.GetData<City>(queryCity)).ToList();

            return new ServiceResult()
            {
                Data = neighbors,
                Error = null,
                MISAeShopCode = MISAeShopServiceCode.Success
            };
        }
    }
}



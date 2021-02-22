using Misa.Common;
using Misa.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Interface
{
    public interface IWardBussiness : IBaseBussiness<Ward>
    {
        /// <summary>
        /// Lấy ra danh sách xã/phường theo quận/huyện- kỹ thuật DI
        /// </summary>
        /// <param name="countryId">id quận/ huyện</param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public Task<ServiceResult> GetData(int? districtId);

        /// <summary>
        /// Lấy ra danh sách xã/phường cùng quận/huyện ,danh sách quận/huyện cùng tỉnh/thành phố, danh sách tỉnh/ thành phố cùng quốc gia- kỹ thuật DI
        /// </summary>
        /// <param name="countryId">id xã/phường</param>
        /// <returns>ServiceResult</returns>
        /// create :22/2/2021
        public Task<ServiceResult> Neighbors(int ward);
    }
}

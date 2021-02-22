using Misa.Common;
using Misa.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Interface
{
    public interface IDistrictBussiness : IBaseBussiness<District>
    {
        /// <summary>
        /// Lấy ra danh sách quận/huyện theo thành phố - kỹ thuật DI
        /// </summary>
        /// <param name="countryId">id tỉnh/ thành phố</param>
        /// <returns>ServiceResult</returns>
        /// create :4/2/2021
        public Task<ServiceResult> GetData(int? cityId);
    }
}

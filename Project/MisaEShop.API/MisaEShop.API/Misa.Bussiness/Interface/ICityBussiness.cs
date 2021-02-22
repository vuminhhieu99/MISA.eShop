using Misa.Common;
using Misa.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Bussiness.Interface
{
    public interface ICityBussiness: IBaseBussiness<City>
    {
        /// <summary>
        /// Lấy ra danh sách thành phố theo quốc gia - kỹ thuật DI
        /// </summary>
        /// <param name="countryId">id quốc gia</param>
        /// <returns>ServiceResult</returns>
        /// create :22/2/2021
        public Task<ServiceResult> GetData(int? countryId);
    }
}

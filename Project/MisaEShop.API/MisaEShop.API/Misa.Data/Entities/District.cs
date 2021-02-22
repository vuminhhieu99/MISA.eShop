using System;
using System.Collections.Generic;
using System.Text;

namespace Misa.Common.Entities
{
    public class District
    {
        /// <summary>
        /// id quận/huyện
        /// </summary>
        public int DistrictId { get; set; }
        /// <summary>
        /// tên quận/huyện
        /// </summary>
        public string DistrictName { get; set; }
        /// <summary>
        /// id tỉnh/thành phố
        /// </summary>
        public int CityId { get; set; }
    }
}

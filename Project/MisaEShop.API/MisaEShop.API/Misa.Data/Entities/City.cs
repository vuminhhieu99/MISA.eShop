using System;
using System.Collections.Generic;
using System.Text;

namespace Misa.Common.Entities
{
    public class City
    {
        /// <summary>
        /// id tỉnh/thành phố
        /// </summary>
        public int CityId { get; set; }
        /// <summary>
        /// tên tỉnh/thành phố
        /// </summary>
        public string CityName { get; set; }
        /// <summary>
        /// id quốc gia
        /// </summary>
        public int CountryId { get; set; }
    }
}

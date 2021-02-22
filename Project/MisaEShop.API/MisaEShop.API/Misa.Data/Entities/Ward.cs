using System;
using System.Collections.Generic;
using System.Text;

namespace Misa.Common.Entities
{
    public class Ward
    {
        /// <summary>
        /// id xã/phường
        /// </summary>
        public int WardId { get; set; }
        /// <summary>
        /// tên xã/phường
        /// </summary>
        public string WardName { get; set; }
        /// <summary>
        /// id quận/huyện
        /// </summary>
        public int DistrictId { get; set; }
    }
}

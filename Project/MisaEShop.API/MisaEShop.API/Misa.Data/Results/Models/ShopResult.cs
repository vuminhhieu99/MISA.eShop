using System;
using System.Collections.Generic;
using System.Text;

namespace Misa.Common.Results.Models
{
    public class ShopResult
    {
        public ShopResult()
        {
            ShopId = Guid.NewGuid().ToString();
        }
        /// <summary>
        /// Id cửa hàng
        /// </summary>
        public string ShopId { get; set; }

        /// <summary>
        /// Mã cửa hàng
        /// </summary>
        public string ShopCode { get; set; }

        /// <summary>
        /// Tên cửa hàng
        /// </summary>
        public string ShopName { get; set; }

        /// <summary>
        /// Địa chỉ cửa hàng
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// Số điện thoại
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// Mã số thuế
        /// </summary>
        public string TaxCode { get; set; }

        /// <summary>
        /// Mã trạng thái
        /// </summary>
        public int StatusId { get; set; }

        /// <summary>
        /// Tên trạng thái
        /// </summary>
        public string StatusName { get; set; }

        /// <summary>
        /// Tên đường
        /// </summary>
        public string Street { get; set; }

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? createDate { get; set; }

        /// <summary>
        /// Tên nhân viên đã tạo
        /// </summary>
        public string createUserName { get; set; }
    }
}

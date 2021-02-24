using Misa.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace Misa.Data.Entities
{
    public class Shop
    {
        
        public Shop()
        {
            ShopId = Guid.NewGuid().ToString().Replace("-", String.Empty);
           
        }
        /// <summary>
        /// Mã cửa hàng
        /// </summary>
        public string ShopId { get; set; }

        /// <summary>
        /// chuối thay thế vì dapper không hỗ trợ chuyển từ string sang guid với sql server
        /// </summary>
        //public string ShopIdString
        //{
        //    get { return ShopId.ToString("N"); }
        //    set { ShopId = new Guid(value); }
        //}
        /// <summary>
        /// Mã cửa hàng
        /// </summary>
        [Required]
        [MaxLength(30)]
        [Duplicate]
        public string ShopCode { get; set; }

        /// <summary>
        /// Tên cửa hàng
        /// </summary>
        [Required]
        [MaxLength(100)]
        [Duplicate]
        public string ShopName { get; set; }

        /// <summary>
        /// Địa chỉ
        /// </summary>
        [Required]
        [MaxLength(400)]
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
        /// Mã số phường/xã
        /// </summary>
        public int? WardId { get; set; }

        /// <summary>
        /// Mã trạng thái
        /// </summary>
        [Default(1)]
        public int?  StatusId { get; set; }     

        /// <summary>
        /// Tên đường
        /// </summary>
        public string Street { get; set; }

        /// <summary>
        /// Thời gian tạo
        /// </summary>
        public DateTime? CreateDate { get; set; }
        /// <summary>
        /// Id người tạo
        /// </summary>
        public string CreateUserId { get; set; }
        
    }
}

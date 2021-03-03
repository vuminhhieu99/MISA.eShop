using System;
using System.Collections.Generic;
using System.Text;
using Misa.Common.Entities;

namespace Misa.Common.Entities
{
    public class User
    {
        public User()
        {
            UserId = Guid.NewGuid().ToString().Replace("-", String.Empty);
            UserGroupId = 1;
            Active = true;

        }
        /// <summary>
        /// id ng
        /// </summary>
        [MaxLength(36)]
        public string UserId { get; set; }

        [MaxLength(20)]
        [Required]
        public string UserName { get; set; }

        [MaxLength(16)]
        [Required]
        public string Password { get; set; }

        [MaxLength(50)]
        public string FullName { get; set; }

        public DateTime CreateDate { get; set; }

        [MaxLength(400)]
        public string Avatar { get; set; }

        public int UserGroupId { get; set; }

        [Required]
        public bool Active { get; set; }


    }
}

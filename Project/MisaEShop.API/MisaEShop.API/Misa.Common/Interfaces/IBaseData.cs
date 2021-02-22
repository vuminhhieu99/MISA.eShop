using Misa.Common.Requests;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace Misa.Data.Interfaces
{
    public interface IBaseData<T>
    {
        /// <summary>
        /// Lấy danh sách theo chuỗi sql - kỹ thuật DI
        /// </summary>
        /// <param name="commandText">chuỗi sql</param>
        /// <param name="parameters">tham sô truyền vào</param>
        /// <param name="commandType">Kiểu truy vấn</param>
        /// <returns>Danh sách đối tượng</returns>
        public Task<IEnumerable<T>> GetData(string commandText = null, object parameters = null, CommandType commandType = CommandType.Text);

        /// <summary>
        /// Lấy danh sách theo chuỗi sql chỉ định đầu ra cụ thể - kỹ thuật DI
        /// </summary>
        /// <param name="commandText">chuỗi sql</param>
        /// <param name="parameters">tham sô truyền vào</param>
        /// <param name="commandType">Kiểu truy vấn</param>
        /// <returns>Danh sách đối tượng</returns>
        public Task<IEnumerable<T2>> GetData<T2>(string commandText = null, object parameters = null, CommandType commandType = CommandType.Text);

        /// <summary>
        /// Lấy danh sách đối tượng theo số trang và kích thước trang - kỹ thuật DI
        /// </summary>
        /// <param name="pageRequestBase">số trang và kích thước trang</param>
        /// <returns>danh sách đối tượng</returns>
        public Task<IEnumerable<T>> GetData(PageRequestBase pageRequestBase);

        /// <summary>
        /// Lấythông tin đối tượng theo id - kỹ thuật DI
        /// </summary>
        /// <param name="id"> Id của đối tượng</param>
        /// <returns>1 đối tượng</returns>
        /// create: 5/2/2021
        public Task<T> GetById(object id);

        /// <summary>
        /// Lấy đối tượng theo id chỉ định đầu ra cụ thể
        /// </summary>
        /// <param name="id">Id của đối tượng</param>
        /// <returns>Một đối tượng</returns>
        /// create: 22/2/2021
        public Task<T2> GetById<T2>(object id);

        /// <summary>
        /// Thêm mới đối tượng - kỹ thuật DI
        /// </summary>
        /// <param name="entiry">thông tin đối tượng</param>
        /// <returns>số dòng bị ảnh hưởng</returns>
        /// create: 5/2/2021
        public Task<int> Insert(T entiry);


        /// <summary>
        /// Cập nhật thông tin đối tượng - kỹ thuật DI
        /// </summary>
        /// <param name="entiry">thông tin đối tượng</param>
        /// <returns>số dòng bị ảnh hưởng</returns>
        /// create: 5/2/2021
        public Task<int> Update(T entiry);

        /// <summary>
        /// Xóa đối tượng - kỹ thuật DI
        /// </summary>
        /// <param name="id">id của đối tượng:</param>
        /// <returns>số dòng bị ảnh hưởng</returns>
        /// create: 5/2/2021        
        public Task<int> Delete(string id);
    }
}

<template>
  <aside class="content">
    <section class="list-button h-container-row h-active">
      <button class="h-btn h-btn-1" @click="openShopModalCreate()">
        <i class="h-icon h-icon-add"></i>
        <p>Thêm mới</p>
      </button>
      <button class="h-btn h-btn-1">
        <i class="h-icon h-icon-copy"></i>
        <p>Nhân bản</p>
      </button>
      <button class="h-btn h-btn-1" @click="openShopModalEdit()">
        <i class="h-icon h-icon-edit"></i>
        <p>Sửa</p>
      </button>
      <button class="h-btn h-btn-1" @click="openShopModalDelete()">
        <i class="h-icon h-icon-delete"></i>
        <p>Xóa</p>
      </button>
      <button class="h-btn h-btn-1">
        <i class="h-icon h-icon-refresh"></i>
        <p>Nạp</p>
      </button>
      <!-- /.container-fluid -->
    </section>
    <section class="content-main">
      <!-- control content -->
      <table
        id="tbListData"
        cellspacing="0"
        cellpadding="0"
        border="0"
        class="el-table__body"
        style="min-width: 100%"
      >
        <thead class="has-gutter">
          <tr class="el-table__row">
            <th colspan="1" rowspan="1" fieldName="shopCode">
              <div class="cell">Mã cửa hàng{{search.shopCode}}</div>
              <div class="h-container-row">
                <button class="h-btn button-all">*</button>
                <input class="form-control" v-model="search.shopCode" />
              </div>
            </th>
            <th colspan="1" rowspan="1" fieldName="fullName">
              <div class="cell">Tên cửa hàng</div>
              <div class="h-container-row">
                <button class="h-btn button-all">*</button>
                <input class="form-control" v-model="search.shopName" />
              </div>
            </th>
            <th colspan="1" rowspan="1">
              <div class="cell w-82">Địa chỉ</div>
              <div class="h-container-row">
                <button class="h-btn button-all">*</button>
                <input class="form-control" v-model="search.address" />
              </div>
            </th>
            <th colspan="1" rowspan="1">
              <div class="cell">Số điện thoại</div>
              <div class="h-container-row">
                <button class="h-btn button-all">*</button>
                <input class="form-control" v-model="search.phone" />
              </div>
            </th>
            <th colspan="1" rowspan="1" fieldName="phoneNumber">
              <div class="cell">trạng thái</div>
              <div class="h-container-row">
                <select name="statusName" class="form-control" v-model="search.statusId" >
                  <option value="0">--Chọn trạng thái--</option>
                  <option value="1">Đang hoạt động</option>
                  <option value="2">Ngừng hoạt động</option>
                  <option value="3">Đang thi công</option>
                </select>
              </div>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            class="el-table__row first"
            v-for="shop in shops"
            :key="shop.shopId"
            @click="selectRow(shop.shopId)"
            v-bind:class="isSelected(shop.shopId) ? 'h-color-selecd-row' : ''"
          >
            <td>
              <div class="cell">{{ shop.shopCode }}</div>
            </td>
            <td>
              <div class="cell">{{ shop.shopName }}</div>
            </td>
            <td>
              <div class="cell">
                {{ shop.address }}
              </div>
            </td>
            <td>
              <div class="cell">{{ shop.phone | getPhone }}</div>
            </td>
            <td>
              <div class="cell">{{ shop.statusName }}</div>
            </td>
          </tr>
        </tbody>
      </table>
    </section>
    <ShopModalCreate ref="ShopModalCreate_ref" @created="createCofirm"/>
    <ShopModalEdit ref="ShopModalEdit_ref" :shopIdEdit="shopIdEdit"  @edited="editCofirm"/>
    <ShopModalDelete ref="ShopModalDelete_ref"
      :listId="selected"
      @deleted="deletedCofirm" />
    <ShopModalConfirm
      ref="ShopModalConfirm_ref"
      :confirm="confirm"
      
    />   
    <FooterShopManagement   
       :shopTotal="shopTotal" 
       @selectPage="getData"
       />
  </aside>
</template>

<script>
import * as axios from "axios";
import ShopModalCreate from "../modals/ShopManagement/ShopModalCreate.vue";
import ShopModalEdit from "../modals/ShopManagement/ShopModalEdit.vue";
import ShopModalDelete from "../modals/ShopManagement/ShopModalDelete.vue";
import ShopModalConfirm from "../modals/ShopManagement/ShopModalConfirm.vue";
import FooterShopManagement from "../footers/FooterShopManagement.vue";
const RESOURCE = {
    ERROR_SELECT_MULTI : "Vui lòng chỉ chọn 1 cửa hàng",
    ERROR_SELECT_NOT : "Vui lòng chọn cửa hàng",
};
export default {
  props: {
    msg: String,
  },
  data() {
    return {
      RESOURCE,
      debounce: null,
      shops: [],
      shopIdEdit: "",
      confirm: {
          message: "",
          success: true,
      },      
      shopTotal: 25,
      selected: [],      
      search: {
        shopCode: "",
        shopName: "",
        address: "",
        phone: "",   
        statusId: null,     
       
      }
    };
  },
  components: {
    ShopModalCreate,
    ShopModalEdit,
    ShopModalDelete,
    ShopModalConfirm,
    FooterShopManagement,
  },
  methods: {
    // mở form thêm mới cửa hàng
    openShopModalCreate: async function() {
      await this.$refs.ShopModalCreate_ref.show();     
      //this.$refs.ShopModalConfirm_ref.show();
    },
    // mở form xác nhận xóa cửa hàng
    openShopModalDelete: async function() {
       if (this.selected.length < 1) {
        alert("vui lòng chọn nhân viên");
        return;
      }     
      await this.$refs.ShopModalDelete_ref.show();
    },

    // mở form sửa cửa hàng
    openShopModalEdit: async function() {
       if (this.selected.length < 1) {
       this.confirm.message = RESOURCE.ERROR_SELECT_NOT;
        this.confirm.success = false;
        await this.$refs.ShopModalConfirm_ref.show();
        return;
      } else if (this.selected.length > 1) {
        this.confirm.message = RESOURCE.ERROR_SELECT_MULTI;
        this.confirm.success = false;
        await this.$refs.ShopModalConfirm_ref.show();
        return;
      }
      this.shopIdEdit = this.selected[0];
      await this.$refs.ShopModalEdit_ref.show();
      //this.$refs.ShopModalConfirm_ref.show();
    },

    // kiểm tra xem đã nhấn dòng chưa để sửa ui
    isSelected:function(id) {
      const index = this.selected.indexOf(id);
      if (index > -1) return true;
      return false;
    },
    // thêm hoặc xóa dòng đã chọn vào list selected
    selectRow: function(id) {
      const index = this.selected.indexOf(id);
      if (index > -1) {
        this.selected.splice(index, 1);
      } else {
        this.selected.push(id);
      }
      console.log(this.selected);
    },
    
    // lấy data
    getData: async function(pageIndex = 1, pageSize = 10) {
      console.log("getData");
      this.processing = true;
      this.resetSelected();
      const response = await axios.get("https://localhost:44336/api/Shop", {
        params:{
           pageIndex:  pageIndex,
            pageSize: pageSize,
            shopCode: this.search.shopCode,
            shopName: this.search.shopName,
            address: this.search.address,
            phone: this.search.phone,   
            statusId: this.search.statusId,
        }        
      });
      this.shops = response.data.data.items;
      this.shopTotal = response.data.data.totalRecord;     
      //this.shops = response.data;   
      // this.processing = false;
      // console.log(this.shops);
    },
    // xóa hết các dòng được chọn
    resetSelected: async function() {
      this.selected.length = 0;
    },

    

     //phản hồi dữ liệu từ form create nhân viên
    createCofirm : async function(res, leave){
      console.log("set res");
      if(res.misAeShopCode == 200){
        this.confirm.message = "Thêm mới thành công";
        this.confirm.success = true;
        if(leave == true){
          await this.getData();
        }
        else{
          await Promise.all([this.$refs.ShopModalCreate_ref.hide(), this.getData()]); 
        }
        await this.$refs.ShopModalCreate_ref.resetForm();
      }
      else if(res.misAeShopCode == 500){
        this.confirm.message = res.error[0].userMsg ;
        this.confirm.message += "\n" +res.error[0].devMsg;
        this.confirm.success = false;        
      }
      else{
        var err = "";
        res.error.forEach(function(item){
            err += item.userMsg.toString() +"\n";
        });
        this.confirm.message = "Thêm mới thất bại\n" +err;
        this.confirm.success = false;
         
      }
      await this.$refs.ShopModalConfirm_ref.show();
    },
     editCofirm: async function (res) {
       console.log("confirm update");
      if (res.misAeShopCode == 200) {
        this.confirm.message = "Cập nhật thành công";
        this.confirm.success = true;        
        await Promise.all([this.$refs.ShopModalEdit_ref.hide(),this.getData()]);       
      } 
      else if(res.misAeShopCode == 500){
        this.confirm.message = res.error[0].userMsg ;
       this.confirm.message += "\n" +res.error[0].devMsg;
        this.confirm.success  = false;        
      }
      else{
        var err = "";
        res.error.forEach(function(item){
            err += item.userMsg.toString() +"\n";
        });
        this.confirm.message = "Cập nhật thất bại\n" +err;
         this.confirm.success  = false;        
      }
      await this.$refs.ShopModalConfirm_ref.show()
      
    },
    deletedCofirm: async function (res) {
      console.log("confirm");
         
      var strAnnounce = "";     
      res.forEach(function(item){
          if(item.status == false){
            strAnnounce = strAnnounce + " xóa thất bại: " + item.id +"\n";
          }
          else{
            strAnnounce = strAnnounce + " Xóa thành công: " + item.id + "\n";
          }
      });        
     
      
        alert(strAnnounce);
        await this.getData();
        await this.$refs.ShopModalDelete_ref.hide();
        
      
    },
  },

  filters: {
    // thêm dấu cách vào vị trí thứ 3 của số điện thoại
    getPhone: function(value) {
      
      if (value != "" && value != null && value != undefined) {
        var phone = /\b(\d{1,3})(\d*)\b/;
        var match = phone.exec(value);        
      }
      return match.splice(1).join(' ');
    }    
  },
  async created() {
      await this.getData();
    },

  watch: {
     pageIndex: async function () {
      await this.getData();      
    },
    // 'search':async function (){
    //   console.log("watch search");
    //    await this.getData(); 
    // }
    search: {
     async handler(){ // trình theo dõi sâu đối với object
       console.log("watch search");
       clearTimeout(this.debounce);
      this.debounce = setTimeout(() =>  {
         this.getData(1);
      }, 1000)
     },
     deep: true
  }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/* overide form-control from input.scss */
.form-control {
  height: 35px;
  border-radius: 0;
}
.content-main {
  overflow-x: auto;
  overflow-y: auto;
}

.button-all {
  line-height: 35px;
  background-color: #ffffff;
  border: 1px solid #bbbbbb;
  color: #000000;
  border-radius: 0;
  transition: 0.2s;
}

.button-all:hover{
  transition: 0.2s;
    transform: scale(1.05);
     box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%), 0 0 20px rgb(102 175 233 / 40%);
}

.content-header {
  margin: 0 1rem 0.5rem 1rem;
}
.list-button {
  height: 35px;
}

.list-button button {
  border-right: 1px solid #004666;
  background-color: #00557b;
  border-radius: 0;
}
.list-button button:hover {
  background-color: #0088c1;
}

th:first-child {
  width: 136px;
}

tr td:nth-child(3) {
  max-width: 360px;
  min-width: 300px;
}

tr td:nth-child(3) {
  max-width: 700px;
  min-width: 500px;
}

th:nth-child(4) {
  width: 180px;
}

th:last-child {
  width: 188px;
}
</style>
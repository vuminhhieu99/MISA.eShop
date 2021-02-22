<template>
  <section class="h-container-row-center footer">
    <button class="h-btn h-btn-4" @click="pageIndex = 1">
      <i class="h-icon h-icon-arow-double-left"></i>
    </button>
    <button class="h-btn h-btn-4" @click="pageIndex -= 1">
      <i class="h-icon h-icon-arow-left"></i>
    </button>
    <p>Trang</p>
    <input type="text" class="form-control" v-model="pageIndex" />
    <p>Trên {{ pageCount }}</p>
    <button class="h-btn h-btn-4" @click="pageIndex += 1">
      <i class="h-icon h-icon-arow-right"></i>
    </button>
    <button class="h-btn h-btn-4" @click="pageIndex = pageCount">
      <i class="h-icon h-icon-arow-double-right"></i>
    </button>
    <button class="h-btn h-btn-4">
      <i class="h-icon h-icon-refresh-active"></i>
    </button>
    <select class="form-control select" v-model="pageSize">
      <option :value="5">5</option>
      <option :value="10">10</option>
      <option :value="20">20</option>
      <option :value="50">50</option>
    </select>

    <span class="ml-auto"
      >Hiển thị {{ start }} - {{ end }} trên {{ shopTotal }} kết quả</span
    >
  </section>
</template>

<script>
export default {
  name: "Header",
  props: {
    msg: String,
    shopTotal: Number,
  },
  data() {
    return {
      pageIndex: 1,
      pageSize: 10,
      shopCount: 10,
    };
  },
  computed: {
    pageCount() {
      if (this.shopTotal % this.pageSize == 0)
        return Math.floor(this.shopTotal / this.pageSize);
      return Math.floor(this.shopTotal / this.pageSize) + 1;
    },
    start() {
      ///trường hợp không có bản ghi
      if(this.pageCount == 0){
        return 0
      }
      return (this.pageIndex - 1) * this.pageSize + 1;
    },
    end() {
      ///trường hợp không có bản ghi
      if(this.pageCount == 0){
        return 0
      }
      if (this.pageIndex == this.pageCount) return this.shopTotal;
      return this.start + this.pageSize - 1;
    },
  },
  watch: {    
    //kiểm tra tính hợp lệ của trang số
    pageIndex: function (newValue, oldValue) {
      if (
        newValue > this.pageCount ||
        /0|[a-z]|\s|[!@#$&*\\/\\?]/.test(newValue)
      ) {
        this.pageIndex = oldValue;
      } else {
        this.$emit("selectPage", this.pageIndex, this.pageSize);
      }
    },
    pageSize: function () {
      if (this.pageIndex > this.pageCount) {
        this.pageIndex = this.pageCount;
      } else {
        this.$emit("selectPage", this.pageIndex, this.pageSize);
      }
    },
    shopTotal :function () {
      this.pageIndex =1;
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
button {
  margin-right: 0.275rem;
}
p {
  margin-right: 20px;
  margin-left: 5px;
}
.form-control {
  width: 44px;
  text-align: center;
  height: 30px;
  margin-right: 0.275rem;
  border: 1px solid #bbbbbb;
}
select {
  width: 68px !important;
  text-align: left;
}
button:focus {
  outline: 0;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075),
    0 0 8px rgba(102, 175, 233, 0.6);
}
</style>
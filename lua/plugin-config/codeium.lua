local status_ok, codeium = pcall(require, "codeium")
if not status_ok then
	vim.notify("没有安装 codeium")
	return
end

codeium.setup({
	enable_chat=true,
	detect_proxy=true,
	tools = {
		curl="/usr/bin/curl"
	}
})

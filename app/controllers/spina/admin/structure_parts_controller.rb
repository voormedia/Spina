module Spina
  module Admin
    class StructurePartsController < AdminController
      def destroy
        # Hack to allow removing attachments from pages
        @structure_part = StructurePart.find(params[:id])
        @structure_part.destroy
        redirect_back fallback_location: spina.admin_pages_path
      end
    end
  end
end
